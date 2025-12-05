TYPE UDT_MOTOR_AUX_FLT :
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
	
    Estrutura de falhas do motor, contém os bits de falhas do motor,
	caracterizado por ser falhas que interrompem o funcionamento do motor.
	
	Exemplos de alarmes contidos aqui:
	- falha na partida
	- falha no inversor
    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)
	// ========================================
	// BYTE 0 – Falhas Elétricas Críticas
	// ========================================
	driveFailure            : BIT := FALSE;   // 1 = Falha geral no inversor (TRIP)
	protectionUnitTrip      : BIT := FALSE;   // 1 = Unidade de Proteção do Motor Ativa
	breakerTripped          : BIT := FALSE;   // 1 = Disjuntor aberto
	lackOfPhase             : BIT := FALSE;   // 1 = Falta de fase
	startFailure            : BIT := FALSE;   // 1 = Falha na partida
	stopFailure             : BIT := FALSE;   // 1 = Falha na parada
	fieldbusCommFail        : BIT := FALSE;   // 1 = Perda total de comunicação (TRIP)
	dcLink                  : BIT := FALSE;   // 1 = Falha no barramento DC

	// ========================================
	// BYTE 1 – Falhas Térmicas e de Potência
	// ========================================
	motorOvertempTrip       : BIT := FALSE;   // 1 = Motor superaquecido (PTC/termistor)
	driveOvertempTrip       : BIT := FALSE;   // 1 = Inversor superaquecido
	torqueLimitTrip         : BIT := FALSE;   // 1 = Torque excedeu limite
	overcurrentTrip         : BIT := FALSE;   // 1 = Sobrecorrente
	overvoltageTrip         : BIT := FALSE;   // 1 = Sobretensão
	undervoltageTrip        : BIT := FALSE;   // 1 = Subtensão crítica
	groundFault             : BIT := FALSE;   // 1 = Falha à terra
	
	// -----------------------------
	// BYTES 2 e 3 - RESERVA
	// -----------------------------
	z_reserve : ARRAY[0..1] OF BYTE := [2(16#00)]; 	  // Bytes de reserva para os alarmes do motor 2 e 3
	
	// tamanho total: 4 bytes (2 words)
	
END_STRUCT
END_TYPE
