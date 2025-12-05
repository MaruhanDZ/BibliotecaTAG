(*
    UDT_MOTOR
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-13  William R. Schulz     Versão inicial
    --------------------------------------------------------------------
    0.0.1     2025-05-12  Maruhan D. Zandonai   Adição de UDT CFG
	
    Estrutura principal do motor. Este UDT consolida todas as informações e
    funcionalidades do equipamento, incluindo identificação, diagnóstico,
    status, alarmes, falhas, comandos, feedbacks, escrita interna, parâmetros
    de processo e controle PID.

    Ele serve como bloco unificado para representação completa do motor no CLP,
    facilitando padronização, manutenção, legibilidade do código e integração 
    com interfaces HMI/SCADA.

    Observação:
    Este UDT utiliza todos os UDTs auxiliares padronizados (PV, SP, CMD, VAR,
    FBK, STS, WRITE), garantindo organização clara entre cada tipo de variável.
*)
TYPE UDT_MOTOR :
STRUCT

    // ============================================================================
    //  Estrutura geral do motor
    //  Cada sub-UDT contém um agrupamento específico de informações:
    //  - ALM     → Alarmes do equipamento
    //  - CMD     → Comandos provenientes do usuário / supervisório
    //  - CFG    → Configurações   
    //  - DISABLE → Habilitação/desabilitação de alarmes e falhas
    //  - EQUIP   → Dados fixos e identificação do equipamento
    //  - FLT     → Falhas detectadas pelo sistema
    //  - IO      → Estado das entradas/saídas físicas
	//  - INTERLOCK → Intertravamentos  de processo
    //  - PV      → Valores medidos / variáveis de processo
    //  - SP      → Setpoints ajustados
    //  - STS     → Estados internos do CLP
    //
    //  *UDT_PID foi mantido como comentário, pois havia sido comentado no original.
    // ============================================================================

    (*
    pid               : UDT_PID;                        // Controlador PID associado ao motor (opcional)
    *)

    alm               : UDT_MOTOR_AUX_ALM;              // Alarmes do equipamento

    // --------------------------------------------------------------------------
    cmd               : UDT_MOTOR_AUX_CMD;              // Comandos do usuário/supervisório

    // --------------------------------------------------------------------------
    cfg               : UDT_MOTOR_AUX_CFG;              // Comandos do usuário/supervisório

    // --------------------------------------------------------------------------
    disable           : UDT_MOTOR_AUX_DISABLE;          // Habilitação/desabilitação de alarmes e falhas

    // --------------------------------------------------------------------------
    equip             : UDT_MOTOR_AUX_EQUIP;            // Dados fixos do equipamento (nome, tipo, severidade, etc.)

    // --------------------------------------------------------------------------
    flt               : UDT_MOTOR_AUX_FLT;              // Falhas internas do equipamento

    // --------------------------------------------------------------------------
    interlock         : UDT_MOTOR_AUX_INTERLOCK;        // Falhas internas do equipamento
    
	// --------------------------------------------------------------------------
    io                : UDT_MOTOR_AUX_IO;               // Status das entradas e saídas físicas relacionadas ao motor

    // --------------------------------------------------------------------------
    pv                : UDT_MOTOR_AUX_PV;               // Valores medidos (corrente, tensão, velocidade, temperatura, etc.)

    // --------------------------------------------------------------------------
    sp                : UDT_MOTOR_AUX_SP;               // Setpoints utilizados pelo controle

    // --------------------------------------------------------------------------
    sts               : UDT_MOTOR_AUX_STS;              // Estados internos calculados pelo CLP (intertravamentos, permissivos, etc.)

END_STRUCT
END_TYPE

