		1:
		(*
		Usa como referência o tempo de operação de cada motor e o setpoint de revezamento configurado em cada motor
		se estiver em falha é possivel determinar se será revezado. O revezamento ocorre setando de modo prioritário os motores
		principais e em seguida os complementares.
		quando um motor (principal) atingir o tempo de operação configurado ele solicita uma troca
		o algoritmo passa pelo array de motores e verifica se encontra um que está operando como reserva ou complementar e faz a troca.
		de modo geral se o motor estava operando como principal, ele será substituido por outro motor que esta operando como reserva ou como complementar
		se só houverem motores principais em operação não ocorre nenhum tipo de revezamento
		*)
		
		// Verifica se há o numero requisitados de motores principais e se tem motor disponível


		FOR i := revezamento.cfg.startIndex TO revezamento.cfg.stopIndex DO
		
		{region Contador de tempo para revezar motor}
		
		// Verifica se o motor está ligado e é principal e soma um tempo no contador de tempo dele
		IF motor[i].sts.on AND motor[i].sts.main AND auxTON1s.Q THEN
			motor[i].pv.onTime := motor[i].pv.onTime + 0.00027778; // soma 1s no tempo ligado
		END_IF
		{endregion}
		
		
		IF NOT motor[i].sts.ready OR motor[i].sts.local THEN
			motor[i].sts.main := FALSE;
			motor[i].sts.complementar := FALSE;
			motor[i].sts.backup := FALSE;
		// se não há status no motor
		ELSIF NOT motor[i].sts.main AND NOT motor[i].sts.complementar THEN
			
			// Verifica se está faltando motores principais
			IF revezamento.cfg.shiftMainMotorFlt AND (revezamento.pv.mainMotorCount < revezamento.cfg.mainMotorsNumber) THEN
				motor[i].sts.main := TRUE;
				motor[i].sts.complementar := FALSE;
				motor[i].sts.backup := FALSE;
				revezamento.pv.mainMotorCount := revezamento.pv.mainMotorCount + 1;
			
			// Verifica se está faltando motores complementares e há motores disponíveis
			ELSIF revezamento.cfg.shiftComplementarMotorFlt AND revezamento.pv.complementarMotorCount < revezamento.cfg.complementarMotorsNumber THEN
				motor[i].sts.main := FALSE;
				motor[i].sts.complementar := TRUE;
				motor[i].sts.backup := FALSE;
				revezamento.pv.complementarMotorCount := revezamento.pv.complementarMotorCount + 1;
			ELSE
			// Seta o restante como reserva
				motor[i].sts.main := FALSE;
				motor[i].sts.complementar := FALSE;
				motor[i].sts.backup := TRUE;
			END_IF
		// Verifica se o motor é principal	
		ELSIF motor[i].sts.main THEN
			// se o motor passou o tempo de operação e não está intertravado
			IF NOT revezamento.sts.interlock AND (motor[i].pv.onTime >= motor[i].sp.maxOperationTime OR revezamento.cmd.shiftManual) THEN
				// calcula o indice do próximo motor baseado no indice do motor que solicitou o revezamento
				nextIndex := ((i+auxShiftSp) MOD revezamento.pv.motorCount) + revezamento.cfg.startIndex;
				// verifica se pode trocar para o próximo motor, isto é está em remoto automatico e não é principal
				IF motor[nextIndex].sts.main OR motor[nextIndex].sts.local OR motor[nextIndex].sts.manual THEN
					// se não pode ser esse soma um no indice
					auxShiftSp := auxShiftSp + revezamento.cfg.shiftIncrement;
				ELSE
					// se não faz a troca e seta todos os flags do motor atual em false
					motor[nextIndex].sts.main := TRUE;
					motor[nextIndex].sts.complementar := FALSE;
					motor[nextIndex].sts.backup := FALSE;
					motor[i].sts.main := FALSE;
					motor[i].sts.complementar := FALSE;
					motor[i].sts.backup := FALSE;
					// seta a variavel que faz ele trocar de motor em 1 inicialmente novamente
					auxShiftSp := revezamento.cfg.shiftIncrement;
					// reseta o comando de fazer o revezamento manual
					revezamento.cmd.shiftManual := FALSE;
					revezamento.pv.shiftCount := revezamento.pv.shiftCount + revezamento.cfg.shiftIncrement;
					
					
				END_IF
				
			END_IF	
			
		END_IF
		
		
	
		
	END_FOR 	
	{endregion}
