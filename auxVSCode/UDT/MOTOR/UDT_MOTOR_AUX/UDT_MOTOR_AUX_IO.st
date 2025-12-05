TYPE UDT_MOTOR_AUX_IO :
STRUCT

(*
    UDT_MOTOR_AUX_IO
    -------------------------
	
	Controle de Revisões
    --------------------------------------------------------------------
    Versão    Data        Responsável           Descrição
    --------------------------------------------------------------------
    0.0.0     2025-11-21  Maruhan D. Zandonai     Versão inicial
    --------------------------------------------------------------------
	
	Estrutura que contém os estados das IOs do clp relacionadas ao inversor. Todas as variáveis
	presentes nesta struct são somente de leitura, já que são provenientes das entradass e saídas do clp.
	Tipos de valores esperados aqui:
	- Saídas para o inversor 
	- feedbacks proventientes de entradas digitais
	- entradas e saídas analógicas que vão/vem do inversor.
    Observação:
    Este UDT compõe o UDT_MOTOR, sendo utilizado como bloco auxiliar para 
    organização e padronização dos parâmetros de processo do motor.
*)	

//***************************************   Entradas Digitais   ***************************************
	// ========================================
	// BYTE 0 – // Status proveniente das entradas digitais
	// ========================================
	
	inputLocal				: BIT := FALSE;   	// Estado da entrada digital da seletora local
	inputRemote				: BIT := FALSE;		// Estado da entrada digital da seletora remoto
	inputOn					: BIT := FALSE;		// Estado da entrada digital de feedback liga inversor
	inputEmergency			: BIT := FALSE;		// Estado da entrada digital da botoeira de emergência
	
	// ========================================
	// BYTE 1, 2 e 3 – // Reserva entradas digitais
	// ========================================
	z_reserveDI : ARRAY[0..2] OF BYTE; 	  		// Bytes de reserva para as entradas digitais (1, 2 e 3)
	
//***************************************   Entradas Digitais   ***************************************

////////////////////////////////////////////////////////////////////////////////////////////////////////

//***************************************   Saidas Digitais   ***************************************
	// ========================================
	// BYTE 4 – // Status das saídas digitais
	// ========================================
	outputOn				: BIT := FALSE;   	// Saída digital liga inversor
	outputReset				: BIT := FALSE;		// Saida digital reset inversor
	outputSelect 			: BIT := FALSE; 	// saida digital seleciona inversor
	
	// ========================================
	// BYTE 5, 6 e 7 – // Reserva saidas digitais
	// ========================================
	z_reserveDO : ARRAY[0..2] OF BYTE; 	  		// Bytes de reserva para as saidas digitais (5, 6 e 7)
	
//***************************************   Saidas Digitais   ***************************************

////////////////////////////////////////////////////////////////////////////////////////////////////////

//***************************************   Entradas Analógicas   ***************************************

	// ========================================
	// BYTE 8 e 9 – // Status da entrada analógica
	// ========================================
	analogInputFrequencty	: INT := 0;			// Valor lido da entrada analógica de feedback de frequência 
	
	// ========================================
	// BYTE 10 e 11 – // Status da entrada analógica
	// ========================================
	analogInputCurrent		: INT := 0;			// Valor lido da entrada analógica de feedback da corrente
	
	// ========================================
	// BYTE 12 a 23 – // Reserva para entrada analógica
	// ========================================
	z_reserveAI : ARRAY[0..11] OF BYTE; 	  		// Bytes de reserva para as saidas digitais (12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22 e 23)
	
//***************************************   Entradas Analógicas   ***************************************

////////////////////////////////////////////////////////////////////////////////////////////////////////

//***************************************   Saidas Analógicas   ***************************************

	// ========================================
	// BYTE 24 e 25 – // Status da saída analógica
	// ========================================
	analogOutputFrequency	: INT := 0;			// Valor da saída analógica para referência de frequência do drive
	
	// ========================================
	// BYTE 26 a 33 – // Reserva para entrada analógica
	// ========================================
	z_reserveAO : ARRAY[0..7] OF BYTE; 	  		// Bytes de reserva para as saidas digitais (26, 27, 28, 29, 30, 31, 32, 33)
	
	// ========================================
	// BYTE 34 a 37 – // Reserva para entrada analógica
	// ========================================
	frequencyOutUE			: REAL := 0.0;		// Valor em UE enviado ao inversor
	
	// Byte 38 a 45
	z_reserve1 : ARRAY[0..7] OF BYTE; 	  		// Bytes de reserva para as saidas digitais (26, 27, 28, 29, 30, 31, 32, 33)
	

//***************************************   Saidas Analógicas   ***************************************

	
	// tamanho total: 46 bytes
END_STRUCT
END_TYPE
