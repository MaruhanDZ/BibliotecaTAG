TYPE UDT_MOTOR_AUX_DISABLE :
STRUCT
(*
    UDT_MOTOR_AUX_HAB
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-21  Maruhan D. Zandonai     Versão inicial
    --------------------------------------------------------------------
	
    Estrutura para desabilitar alarmes e falhas, contém as estruturas de alarmes e falhas do motor.
	Setar o bit da falha que deseja-se desabilitar.
	
	    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)

	alm : UDT_MOTOR_AUX_ALM; 		// Tipo de dado para habilitar/desabilitar alarmes
	flt : UDT_MOTOR_AUX_FLT;  		// Tipo de dado para habilitar/desabilitar falhas
	
	// tamanho total: 8 bytes (4 words)
	
END_STRUCT
END_TYPE
