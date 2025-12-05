TYPE UDT_MOTOR_AUX_INTERLOCK :
STRUCT
		(*
    UDT_MOTOR_AUX_INTERLOCK
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-19  Maruhan D. Zandonai     Versão inicial
    --------------------------------------------------------------------
	
    Estrutura de intertravamentos do motor, contém os bits para intertravamentos de processo,
	interrompem o funcionamento do motor.
	
	Exemplos de intertravamentos contidos aqui:
	- nivel baixo
	- pressão alta
    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)

	// ========================================
	// BYTE 0 - Status
	// ========================================
	lowLevel					: BIT := FALSE;		// 1 = Nível baixo 
    highLevel         			: BIT := FALSE;   	// 1 = Nível alto 
    lowPressure       			: BIT := FALSE;   	// 1 = Pressão baixa 
	highPressure				: BIT := FALSE; 	// 1 = Pressão alta 
	lowFlow  					: BIT := FALSE;   	// 1 = Vazão baixa 
	highFlow					: BIT := FALSE;		// 1 = Vazão alta 
	emergencyStop           	: BIT := FALSE;  	// 1 = Botão de emergência pressionado
    
	// -----------------------------
	// BYTES 1 a 3 - RESERVA
	// -----------------------------
	z_reserve : ARRAY[0..2] OF BYTE := [3(16#00)]; 	  // Bytes de reserva
	
	// tamanho total: 4 bytes (2 words)
	
    
END_STRUCT
END_TYPE
