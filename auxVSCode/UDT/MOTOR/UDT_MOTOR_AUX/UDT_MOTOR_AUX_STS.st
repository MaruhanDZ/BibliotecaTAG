(*
    UDT_MOTOR_AUX_WORD_STS
    -----------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-13  William R. Schulz     Versão inicial
    --------------------------------------------------------------------
    0.0.1     2025-11-21       Versão inicial	Adição de diversos bits e bytes reserva
    --------------------------------------------------------------------	
    Estrutura destinada ao armazenamento de status (STS) do motor.
    Representam indicadores de condição do equipamento gerados 
	exclusivamente pelas lógicas internas do CLP.

    Esses valores são variáveis de **somente leitura**, obtidas a partir 
    de processamento lógico, intertravamentos, condições operacionais e 
    verificações internas. Por esse motivo, **não podem ser escritos ou 
    manipulados diretamente pelo usuário**, pois refletem o estado real 
    do motor dentro da lógica de controle.

    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos status do motor.
*)
TYPE UDT_MOTOR_AUX_STS :
STRUCT
	// ========================================
	// BYTE 0 - Status
	// ========================================
	on					: BIT := FALSE;		// 1 = Motor ligado
    auto         		: BIT := FALSE;   	// 1 = Motor está em modo automático
    manual       		: BIT := FALSE;   	// 1 = Motor está em modo manual
	remote				: BIT := FALSE; 	// 1 = Motor está em modo remoto
	local				: BIT := FALSE;		// 1 = Motor está em modo local (impede a atuação por parte do clp) 
    desabilited  		: BIT := FALSE;   	// 1 = Equipamento está desabilitado (impede a operação por parte do clp)
    maintenance    		: BIT := FALSE;   	// 1 = Indica que o motor está em manutenção
    ready	    		: BIT := FALSE;   	// 1 = Indica que o motor está pronto para operar, sem intertravamentos, falhas e etc
	
	// ========================================
	// BYTE 1 - Status
	// ========================================
    interlock    		: BIT := FALSE;   	// 1 = Indica presença de intertravamento de processo ativo	(ex: nivel minimo, vazão minima)
	alm					: BIT := FALSE;		// 1 = Indica a presença de um alarme ativo (ex: falha na leitura analógica)
	flt					: BIT := FALSE;		// 1 = Indica a presença de uma falha ativa (intertrava o motor)
    selected     		: BIT := FALSE;   	// 1 = Indica que o motor foi selecionado entre redundâncias / grupos		
    principal    		: BIT := FALSE;   	// 1 = Indica motor principal em sistemas redundantes
    complementar 		: BIT := FALSE;   	// 1 = Indica motor complementar em sistemas redundantes
    reserva      		: BIT := FALSE;   	// 1 = Indicação de motor reserva (stand-by)
	referencyPID		: BIT := FALSE;		// 1 = Indica que o motor está operando com referência por PID
	
	// -----------------------------
	// BYTES 2 - Status
	// -----------------------------
	referencyFixed		: BIT := FALSE;		// 1 = Indica que o motor está operando com referência fixa
	
	// -----------------------------
	// BYTES 3 - Reserva
	// -----------------------------
	z_reserve : BYTE := 0; 	  // Bytes de reserva para os alarmes do motor 3
	
	// tamanho total: 4 bytes (2 words)
	
END_STRUCT
END_TYPE
