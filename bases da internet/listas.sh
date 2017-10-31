#!/bin/bash
iniciarLista() {
	echo "Você deseja continuar para criar uma lista de comidas ou bebidas ou carros ou frutas? (S/N)";
	read DESEJA_CONTINUAR
	if [ $DESEJA_CONTINUAR == "S" ] || [ $DESEJA_CONTINUAR == "s" ]; then
		criarLista;
	else
		exit;
	fi
}

criarLista() {
	echo "Voçê deseja criar uma lista do que?";
	echo "1 - Comidas";
	echo "2 - Bebidas";
	echo "3 - Carro";
	echo "4 - Frutas";
	echo "Digite o código ou o nome da lista a ser criada ( 1 / 2 / 3 / 4 ) ?";
	read TIPO_LISTA;
	
	if [ $TIPO_LISTA == 1 ] || [ $TIPO_LISTA == "Comidas" ]; then
		nomeLista="Comidas";
		lista=("Pastel" "Pizza" "Lazanha" "Cachorrão" "fundi" "Macarrão" "Coxinha" "Bife a milanesa" "Batata frita" "Bolacha");
	elif [ $TIPO_LISTA == 2 ] || [ $TIPO_LISTA == "Bebidas" ]; then
		nomeLista="Bebidas";
		lista=("Suco de Laranja" "Sprite" "Guarana Antartica" "wisk" "vodka" "pinga" "cerveja" "yakut" "leite" "Danone");
	elif [ $TIPO_LISTA == 3 ] || [ $TIPO_LISTA == "Carro" ];	then
		nomeLista="Carros";
		lista=("Gol" "pallio" "Camaro" "ferrari" "lamburguine" "mustang" "porch" "doge" "saveiro" "fusca");
	elif [ $TIPO_LISTA == 4 ] || [ $TIPO_LISTA == "Frutas" ]; then
		nomeLista="Frutas";
		lista=("Maça""Pera""Uva""Laranja""Pessego""Melancia""Abacaxi""Abacate""Ameixa""Damasco");
	else
		echo "Voçê digitou uma opção invalida favor Selecionar uma opção valida";
		criarLista;
	fi

	salvarArquivo nomeLista lista;
	
	iniciarLista;
}

salvarArquivo(){
	indice=1;
	GUARDAR_ARQUIVO="Lista de ${nomeLista}";
	for item in "${lista[@]}"; do 
		GUARDAR_ARQUIVO=("${GUARDAR_ARQUIVO} \n ${indice} - ${item}");
		((indice++));
	done;

   	NOME_ARQUIVO_FULL="listas"
    	N_LISTA=1;
	OK=0;
	while [ $OK == 0 ]; do
	    if [ $N_LISTA > 1 ]; then
	        NOME_ARQUIVO_FULL="listas-${N_LISTA}.txt";
	    else
	        NOME_ARQUIVO_FULL="listas.txt";
	    fi

		if [ -e $NOME_ARQUIVO_FULL ]; then
			OK=0;
		else
			OK=1;
		fi
		
		N_LISTA=$(($N_LISTA+1));
	done;
	
	echo -e $GUARDAR_ARQUIVO > $NOME_ARQUIVO_FULL;
	echo "Arquivo ${NOME_ARQUIVO_FULL} criado com sucesso!";
}

iniciarLista
