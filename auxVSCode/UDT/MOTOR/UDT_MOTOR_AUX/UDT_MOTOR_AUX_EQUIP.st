(*
    UDT_MOTOR_ALM
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-19  Maruhan D. Zandonai     Versão inicial
    --------------------------------------------------------------------
	
  	Estrutura criada para armazenar informações do equipamento e variaveis usadas em animações
	do supervisório/ihm.
	no geral os campos desta estrutura são manipulados internamente pela biblioteca.
	
*)

TYPE UDT_MOTOR_AUX_EQUIP :
STRUCT

//***************************************   Dados do equipamento   ***************************************

//========================================
// BYTE 0 a 11  –  STRING(11)
//========================================
name              : STRING(11) := '';   // Nome do equipamento (até 10 caracteres)

//========================================
// BYTE 12 a 13 – UINT
//========================================
equipmentType     : UINT := 0;          // Tipo: 0=Indef., 1=Motor, 2=Bomba Centrífuga, 3=Submersível



//***************************************   Status   ***************************************

//========================================
// BYTE 14 a 15 – UINT
//========================================
equipmentStatus   : UINT := 0;          // Status geral

//========================================
// BYTE 16 a 17 – UINT
//========================================
operationMode     : UINT := 0;          // Modo de operação

//========================================
// BYTE 18 a 19 – UINT
//========================================
operationSwitch   : UINT := 0;          // Chave de operação



//***************************************   Falhas   ***************************************

//========================================
// BYTE 20 a 21 – UINT
//========================================
actualFaultCode   : UINT := 0;          // Falha ativa atual

//========================================
// BYTE 22 a 23 – UINT
//========================================
lastFaultCode     : UINT := 0;          // Última falha

//========================================
// BYTE 24 a 25 – UINT
//========================================
severity          : UINT := 0;          // Severidade da falha



//***************************************   Reservas   ***************************************

//========================================
// BYTE 26 a 45 – Reservas (20 bytes)
//========================================
z_reserve         : ARRAY[0..19] OF BYTE := [20(16#00)]; // reservas

// tamanho total 46 bytes (23 words)

END_STRUCT
END_TYPE
