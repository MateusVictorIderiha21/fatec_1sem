#!/bin/bash
iniciarLista() {
	echo "Você deseja criar uma lista de comidas ou bebidas ou carros ou frutas? S/N";
	read desejaContinuar
	if [ $desejaContinuar == "S" ]; then
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
	echo "Digite o código ou o nome da lista a ser criada 1 / 2 / 3 / 4 ?" ;
	read tipoLista;
	lista[];
	if [ $tipoLista == 1 ] || [ $tipoLista == "Comidas" ]; then
		lista=("Pastel", "Pizza", "Lazanha", "Cachorrão", "fundi", "Macarrão", "Coxinha", "Bife a milanesa", "Batata frita", "Bolacha");
	elif [ $tipoLista == 2 ] || [ $tipoLista == "Bebidas" ]; then
		lista=("Suco de Laranja", "Sprite", "Guarana Antartica", "wisk", "vodka", "pinga", "cerveja", "yakut", "leite", "Danone");
	elif [ $tipoLista == 3 ] || [ $tipoLista == "Carro" ];	then
		lista=("Gol", "pallio", "Camaro", "ferrari", "lamburguine", "mustang", "porch", "doge", "saveiro", "fusca");
	elif [ $tipoLista == 4 ] || [ $tipoLista == "Frutas" ]; then
		lista=("Maça","Pera","Uva","Laranja","Pessego","Melancia","Abacaxi","Abacate","Ameixa","Damasco");
	else
		echo "Voçê digitou uma opção invalida, favor Selecionar uma opção valida";
		criarLista;
	fi

	mostrarLista lista;
}

mostrarLista() {
	for item in $lista[*]; do 
		echo "$item";
	done;
}
