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
    Estrutura destinada ao armazenamento de comandos (CMD).
    CMD significa *Command* (Comandos), ou seja, ações que podem ser
    manipuladas diretamente pelo usuário — normalmente através de botões,
    IHM, SCADA ou lógica de interface. Esses comandos não dependem de 
    cálculos ou outras variáveis de processo: são entradas diretas que 
    instruem o motor a realizar funções específicas como partir, parar,
    resetar falhas ou alterar modos de operação.

    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos comandos aplicados ao motor.
*)

TYPE UDT_MOTOR_AUX_CMD :
STRUCT

	// ========================================
	// BYTE 0 – Principais Comandos
	// ========================================
    auto             	: BIT := FALSE;   		// 1 = Modo automático, 0=Modo manual	
    startManual         : BIT := FALSE;   		// 1 = Liga em manual
	startAuto			: BIT := FALSE;			// 1 = Liga em automático
    fltReset       		: BIT := FALSE;   		// 1 = Reset de falhas (usar set)
	almReset			: BIT := FALSE;			// 1 = Reset de alarmes (usar set)
    workTimeReset    	: BIT := FALSE;   		// 1 = Reset do horímetro (usar set)	
    maintenance         : BIT := FALSE;   		// 1 = Colocar equipamento em manutenção (inibe alarmes e falhas e impede comandos)
	pidAuto				: BIT := FALSE;			// 1 = Referência PID, 0=Referência fixa
	
	// -----------------------------
	// BYTES 1 - Principais Comandos
	// -----------------------------
	disableEquipment 	: BIT := FALSE;   		// 1 = Desabilitar o equipamento

	// -----------------------------
	// BYTES 2 e 3 - Principais Comandos
	// -----------------------------
	z_reserve : ARRAY[0..1] OF BYTE := [2(16#FF)]; 	  // Bytes de reserva para os alarmes do motor 1, 2, 3
	
	// tamanho total: 4 bytes (2 words)

END_STRUCT
END_TYPE
