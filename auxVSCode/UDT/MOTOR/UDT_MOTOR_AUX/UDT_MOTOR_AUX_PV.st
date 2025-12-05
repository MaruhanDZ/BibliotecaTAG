(*
    UDT_MOTOR_AUX_PV
    -----------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-13  William R. Schulz     Versão inicial
    --------------------------------------------------------------------
	0.0.1     2025-11-21  Maruhan D. Zandonai   Adição de espaço reserva
    --------------------------------------------------------------------
    Estrutura destinada ao armazenamento de variáveis auxiliares de processo (PV).
    PV significa *Process Value* (Valores de Processo), ou seja, valores obtidos a 
    partir de leituras reais de campo ou cálculos internos do sistema. Por este 
    motivo, não podem ser manipulados diretamente pelo usuário, já que representam 
    grandezas físicas monitoradas ou derivadas do funcionamento do motor.

    Os valores contemplam grandezas elétricas, térmicas e mecânicas utilizadas para 
    supervisão, diagnóstico operacional e indicadores de desempenho do equipamento.

    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)

TYPE UDT_MOTOR_AUX_PV :
STRUCT

	//========================================
	// BYTE 0 a 3
	//========================================
	onTime        : REAL := 0.0;   // Tempo energizado (h)
	
	//========================================
	// BYTE 4 a 7
	//========================================
	offTime       : REAL := 0.0;   // Tempo desligado (h)
	
	//========================================
	// BYTE 8 a 11
	//========================================
	frequency     : REAL := 0.0;   // Frequência atual (Hz)
	
	//========================================
	// BYTE 12 a 15
	//========================================
	velocity      : REAL := 0.0;   // Velocidade (rpm)
	
	//========================================
	// BYTE 16 a 19
	//========================================
	current       : REAL := 0.0;   // Corrente (A)
	
	//========================================
	// BYTE 20 a 23
	//========================================
	voltage       : REAL := 0.0;   // Tensão (V)
	
	//========================================
	// BYTE 24 a 27
	//========================================
	power         : REAL := 0.0;   // Potência (kW)
	
	//========================================
	// BYTE 28 a 31
	//========================================
	torque        : REAL := 0.0;   // Torque (%)
	
	//========================================
	// BYTE 32 a 35
	//========================================
	temperature   : REAL := 0.0;   // Temperatura (°C)
	
	//========================================
	// BYTE 36 a 39
	//========================================
	workTime      : REAL := 0.0;   // Tempo total acumulado (h)
	
	// ========================================
	// BYTE 40  até  80
	// ========================================
	z_reserve                : ARRAY[0..39] OF BYTE;   // Reservas 40 bytes ou 10 variaveis do tipo real
	
	// tamanho total: 80 bytes (40 words)
END_STRUCT
END_TYPE

