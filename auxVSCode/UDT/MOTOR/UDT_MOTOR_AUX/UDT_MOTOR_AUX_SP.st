(*
    UDT_MOTOR_AUX_SP
    -----------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-13  William R. Schulz     Versão inicial
    --------------------------------------------------------------------
	0.0.1     2025-11-21  Maruhan D. Zandonai   Adição de SPs e espaço reserva
    --------------------------------------------------------------------
    Estrutura destinada ao armazenamento de parâmetros de ajuste (SP).
    SP significa *Setpoint*, ou seja, valores de referência configuráveis 
    pelo usuário ou pelo sistema. Estes valores são utilizados para lógica 
    de controle, ajustes operacionais, análises e estratégias de supervisão 
    do motor.

    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos setpoints do motor.
*)

TYPE UDT_MOTOR_AUX_SP :
STRUCT

//***************************************   Tempo   ***************************************
	// ========================================
	// BYTE 0 a 3
	// ========================================
    onTime                   : REAL := 0.0;         // Setpoint de tempo ligado (h)

	// ========================================
	// BYTE 4 a 7
	// ========================================
	offTime                  : REAL := 0.0;         // Setpoint de tempo desligado (h)

	// ========================================
	// BYTE 8 a 11
	// ========================================
	maxOperationTime         : REAL := 4.0E30;        // Tempo máximo de operação (h)

	// ========================================
	// BYTE 12 a 15
	// ========================================
	sleep                    : REAL := 0.0;         // Tempo para sleep

//***************************************   Frequencia   ***************************************
	// ========================================
	// BYTE 16 a 19
	// ========================================
	frequencyFixed           : REAL := 0.0;         // Frequência fixa

	// ========================================
	// BYTE 20 a 23
	// ========================================
	frequencyPID             : REAL := 0.0;         // Frequência do PID

	// ========================================
	// BYTE 24 a 27
	// ========================================
	sleepFrequency           : REAL := 0.0;         // Frequência para iniciar sleep
	
//***************************************   Alarmes   ***************************************
	// ========================================
	// BYTE 28 a 31
	// ========================================
	almCurrentHigh       	 : REAL := 100.0;       // Corrente alta
	
	// ========================================
	// BYTE 32 a 35
	// ========================================
	almCurrentLow      		 : REAL := 0.0;        	// Corrente baixa
	
//***************************************   Reserva   ***************************************
	// ========================================
	// BYTE 36  até  56
	// ========================================
	z_reserve          		 : ARRAY[0..19] OF BYTE := [20(16#00)];   // Reservas 20 bytes ou 5 variaveis do tipo real
	
	// tamanho total: 56 bytes (23 words)

END_STRUCT
END_TYPE
