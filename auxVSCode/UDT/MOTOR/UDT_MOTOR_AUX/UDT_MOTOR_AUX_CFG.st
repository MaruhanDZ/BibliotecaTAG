(*
    UDT_MOTOR_AUX_WORD_CMD
    -----------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-13  William R. Schulz     Versão inicial
    --------------------------------------------------------------------
    0.0.1     2025-11-21  Maruhan D. Zandonai   Adição de comandos e bytes reserva
    --------------------------------------------------------------------	
    Estrutura destinada ao armazenamento de configurações da operação da biblioteca (CFG).
    CMD significa *Configurações* (Comandos), ou seja, variaveis que alteram o comportamento da biblioteca
    como por exemplo habilitar e desabilitar reset automático de falhas e alarmes, ajustar tempos e numero de retentativas automáticas de reset
    definir de onde vem os status do equipamento, etc.

    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos comandos aplicados ao motor.
*)

TYPE UDT_MOTOR_AUX_CFG :
STRUCT

	// ========================================
	// BYTE 0 – Principais Comandos
	// ========================================
	workTimeSource		: BIT := TRUE;			// 1 = Horimetro via CLP, 0 = Horimetro via rede 
	autoFltReset		: BIT := TRUE;			// 1 = Habilita o reset automático de falhas
	autoAlmReset		: BIT := TRUE;			// 1 = Habilita o reset automático de alarmes
	RefPvFrequency		: BIT := FALSE;			// 1 = Frequencia via comunicação, 0 = Frequencia via IO
	refPvCurrent		: BIT := FALSE;			// 1 = Corrente via comunicação, 0 = Frequencia via IO
	refStsOn			: BIT := FALSE;         // 1 = Status ligado via comunicação, 0 = Status ligado via IO
	refStsLocal			: BIT := FALSE;			// 1 = Status local via comunicação, 0 = Status local via IO
	refStsRemote		: BIT := FALSE;			// 1 = Status remoto via comunicação, 0 = Status remoto via IO
	
	// -----------------------------
	// BYTES 1 a 3 Reserva
	// -----------------------------
	z_reserve1 : ARRAY [0..2] OF BYTE := [3(16#00)]; 	        // Bytes de reserva para os alarmes do motor 1, 2, 3
	
	// -----------------------------
	// BYTES 4 Tempo de reset de falhas
	// -----------------------------
	autoFltResetTime		: UINT := 10;			// Tempo para reset automático de falhas (s)

	// -----------------------------
	// BYTES 5 Tempo de reset de alarmes
	// -----------------------------
	autoAlmResetTime		: UINT := 10;			// Tempo para reset automático de alarmes (s)

	// -----------------------------
	// BYTES 6 Tentativas de autoreset
	// -----------------------------
	maxAutoFltResetTry		: UINT := 5;			// Quantidade máxima de vezes que a DO de reset do inversor vai bater no reset automático
	
    // -----------------------------
	// BYTES 7 a 10 Tempo de reset de falhas
	// -----------------------------
    z_reserve2 : ARRAY [0..3]
	// tamanho total: 10 bytes (5 words)

END_STRUCT
END_TYPE
