#!/bin/bash

#Variables
REP="$1"
FILE="$2"

#Fonctions
function carfile { 
        clear
	if [ -d "$REP" ]; then
		echo "$REP OK"
		sleep 2
	else
		echo "Répertoire introuvable"
		sleep 2
		clear
		exit
	fi
	clear
	echo "Répertoire de travail : $REP"
	echo
	echo "Fichiers pouvant être traités :"
	find $REP -maxdepth 1 -name "*.$FILE" -exec basename {} .$REP \;
        read -p "Sélection du fichier(saisir le nom sans extension) :" NAME
	if [ -f "$REP/$NAME.$FILE" ]; then
		echo "--------------------------------------------------------------"
		echo "Caracteristiques de : $NAME"
        	echo
		echo
		echo "--------------------------------------------------------------"
	 	echo
		NBLGN=$(wc -l < $REP/$NAME.$FILE)
		echo "Nombre de lignes :" $NBLGN
		echo "--------------------------------------------------------------"
		echo "Debut du fichier :"
		head -n 2 $REP/$NAME.$FILE
		echo
		echo
		echo "--------------------------------------------------------------"
		echo "Fin du fichier :"
		tail -n 2 $REP/$NAME.$FILE
		echo
		echo
		echo "--------------------------------------------------------------"
		echo
		echo "FIN"
	else
		echo "Le fichier est introuvable"
		sleep 1
		carfile
	fi
}

#Script

carfile
