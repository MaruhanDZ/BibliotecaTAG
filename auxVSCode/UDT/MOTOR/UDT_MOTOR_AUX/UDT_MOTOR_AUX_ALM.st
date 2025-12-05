TYPE UDT_MOTOR_AUX_ALM :
STRUCT
	(*
    UDT_MOTOR_ALM
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-19  Maruhan D. Zandonai     Versão inicial
    --------------------------------------------------------------------
	
    Estrutura de alarmes do motor, contém os bits de alarme do motor,
	caracterizado por ser falhas que não interrompem o funcionamento do motor (continua girando).
	
	Exemplos de alarmes contidos aqui:
	- falha na medição de corrente
	- falha na medição de frequência
	
	    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)

	// -----------------------------
	// BYTE 0 – Medições elétricas
	// -----------------------------
	currentMeasurement     			: BIT := FALSE;    	// 1 = Falha na medição de corrente.
	currentMeasurementOverflow		: BIT := FALSE;	  	// 1 = Overflow na entrada analógica de corrente.
	currentMeasurementUnderflow		: BIT := FALSE;	  	// 1 = Underflow na entrada analógica de corrente.                                    
	frequencyMeasurement	   		: BIT := FALSE;    	// 1 = Falha na medição de frequência.
	frequencyMeasurementOverflow	: BIT := FALSE;		// 1 = Overflow na entrada analógica de frequêcia.	
	frequencyMeasurementUnderflow	: BIT := FALSE;		// 1 = Underflow na entrada analógica de frequência.
	currentOverload			   		: BIT := FALSE;		// 1 = Sobrecorrente no motor.
	currentUnderload				: BIT := FALSE;		// 1 = Subcrrente no motor.
	                                                           
	// -----------------------------                           
	// BYTE 1 – Alarmes variados                                            
	// -----------------------------                           
	autoResetMaxAttempt				: BIT := FALSE;		// 1 = Falhas do motor persistiram após o numero de tentativas de reset automático
	voltageMeasurement	     		: BIT := FALSE;  	// 1 = Alarme na medição de tensão	
	temperatureHigh 				: BIT := FALSE; 	// 1 = Temperatura (motor/inversor) alta                                    
	fanFail		             		: BIT := FALSE;	    // 1 = Ventoinha do inversor ou motor com falha
	excededMaxRuntime         		: BIT := FALSE;	    // 1 = Horas de operação elevadas (manutenção)
	fieldbusComm					: BIT := FALSE;		// 1 = Alarme de perda de comunicação
	
	// -----------------------------
	// BYTES 2 e 3 - RESERVA
	// -----------------------------
	z_reserve : ARRAY[0..1] OF BYTE := [2(16#00)]; 	  // Bytes de reserva para os alarmes do motor 2, 3
	
	// tamanho total: 4 bytes
	
END_STRUCT
END_TYPE
