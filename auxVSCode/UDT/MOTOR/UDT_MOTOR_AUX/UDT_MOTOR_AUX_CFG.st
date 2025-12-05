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
	workTimeSource		: BIT := TRUE;			                // 1 = Horimetro via CLP, 0 = Horimetro via rede 
	autoFltReset		: BIT := TRUE;			                // 1 = Habilita o reset automático de falhas
	autoAlmReset		: BIT := TRUE;			                // 1 = Habilita o reset automático de alarmes
	RefPvFrequency		: BIT := FALSE;			                // 1 = Frequencia via comunicação, 0 = Frequencia via IO
	refPvCurrent		: BIT := FALSE;			                // 1 = Corrente via comunicação, 0 = Frequencia via IO
	refStsOn			: BIT := FALSE;                         // 1 = Status ligado via comunicação, 0 = Status ligado via IO
	refStsLocal			: BIT := FALSE;			                // 1 = Status local via comunicação, 0 = Status local via IO
	refStsRemote		: BIT := FALSE;			                // 1 = Status remoto via comunicação, 0 = Status remoto via IO
	
    // ========================================
	// BYTE 1 – Principais Comandos
	// ========================================
    refInterlockEmergency : BIT := FALSE;                       // 1 = Intertravamento emergência via rede, 0 = Intertravamento emergência via DI     

	// -----------------------------
	// BYTES 2 a 3 Reserva
	// -----------------------------
	z_reserve1 : ARRAY [0..1] OF BYTE := [2(16#00)]; 	        // Bytes de reserva para bits de configuração
	
	// -----------------------------
	// BYTES 4 e 5 Tempo de reset de falhas
	// -----------------------------
	autoFltResetTime		: UINT := 10;			            // Tempo para reset automático de falhas (s)

	// -----------------------------
	// BYTES 6 e 7 Tempo de reset de alarmes
	// -----------------------------
	autoAlmResetTime		: UINT := 10;			            // Tempo para reset automático de alarmes (s)

	// -----------------------------            
	// BYTES 8 e 9 Tentativas de autoreset          
	// -----------------------------            
	maxAutoFltResetTry		: UINT := 5;			            // Quantidade máxima de vezes que a DO de reset do inversor vai bater no reset automático
	
    // -----------------------------            
	// BYTES 10 e 11 Tentativas de autoreset          
	// -----------------------------     
    analogMinValue          : UINT := 0;                        // Valor do registrador proporcional à entrada/saída analógica em seu valor minimo (4mA)
    
    // -----------------------------            
	// BYTES 12 e 13 Tentativas de autoreset          
	// -----------------------------     
    analogMaxValue          : UINT := 27648;                    // Valor do registrador proporcional à entrada/saída analógica em seu valor maximo (4mA)

    // -----------------------------
	// BYTES 14 a 17 Reserva
	// -----------------------------
    z_reserve2 : ARRAY [0..3]  OF BYTE := [4(16#00)];		    // Reserva
	// tamanho total: 10 bytes (5 words)

	// ========================================
	// BYTE 18 a 21
	// ========================================
	analogInputMinFrequency  : REAL := 0.0;                     // Frequencia em Hz no valor mínimo da analógica

	// ========================================         
	// BYTE 22 a 25         
	// ========================================         
	analogInputMaxFrequency  : REAL := 60.0;                    // Frequencia em Hz no valor máximo da analógica

	// ========================================         
	// BYTE 26 a 29         
	// ========================================         
	analogInputMinCurrent    : REAL := 0.0;                     // Corrente em A no valor mínimo da analógica

	// ========================================         
	// BYTE 30 a 33         
	// ========================================         
	analogInputMaxCurrent    : REAL := 100.0;                   // Corrente em A no valor máximo da analógica

    // ========================================
	// BYTE 34 a 37
	// ========================================
	frequencyMax             : REAL := 60.0;                    // Frequência máxima para enviar ao inversor

	// ========================================
	// BYTE 38 a 41
	// ========================================
	frequencyMin             : REAL := 0.0;                     // Frequência mínima para enviar ao inversor

	// ========================================         
	// BYTE 42 a 53         
	// ========================================      
    z_reserve3 : ARRAY [0..11] OF BYTE := [12(16#00)];         // Reserva

    // Tamanho total: 54 Bytes

END_STRUCT
END_TYPE
