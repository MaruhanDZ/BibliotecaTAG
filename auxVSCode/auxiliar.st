
// Faz a configuração inicial de todos os motores para colocar em automatico, remoto e desabilitar o autoReset de falhas
IF NOT doneInitialCfg THEN
FOR i:= 0 TO ANY_TO_UINT(UPPER_BOUND(GVL_MOTORES.motor,1)) DO
	GVL_MOTORES.motor[i].cmd.auto := TRUE;
	GVL_MOTORES.motor[i].io.inputRemote := TRUE;
	GVL_MOTORES.motor[i].cfg.autoFltReset := FALSE;
END_FOR
doneInitialCfg := TRUE;
END_IF

// Passa o feedback de ligado quando a saída de ligar o motor é acionada e executa todos os blocos do motor
FOR i:= 0 TO ANY_TO_UINT(UPPER_BOUND(GVL_MOTORES.motor,1)) DO
	// Blocos dos motores
	FB_MOTORES[i](motor:= GVL_MOTORES.motor[i]);
	// Avalia se é pra ligar ou não o motor
	IF GVL_MOTORES.motor[i].sts.main AND ligarPrincipal OR GVL_MOTORES.motor[i].sts.complementar AND ligarComplementar THEN
		GVL_MOTORES.motor[i].cmd.startAuto := TRUE;
	ELSE
		GVL_MOTORES.motor[i].cmd.startAuto := FALSE;	
	END_IF
	// Passa o feedback de ligado de acordo com o comando de ligar
	GVL_MOTORES.motor[i].io.inputOn := GVL_MOTORES.motor[i].io.outputOn;
END_FOR
