#!/bin/bash
clear
echo "===================================================="
echo "                Auto Install Linux"
echo "===================================================="
echo ""
echo "User:" $USER;

if [[ $USER != root ]] 
then
	echo "Atención: no esta ejecutando $0 como root"
fi

echo ""
echo "Lista de programas:"
DIR_SCRIPTS=programs/*
ITERATOR=0

for f in $DIR_SCRIPTS
do
	PROGRAMS+=($f)
	(( ITERATOR += 1 ))
	echo -e "  $ITERATOR) \c" 
	echo ${PROGRAMS[(( ITERATOR - 1 ))]} | cut -d'/' -f2 | cut -d'.' -f1
done

echo "  q) Salir"

echo -n "Opción> "
read OPTION

if [ "$OPTION" == "q" ]
	then
		echo "Saliendo...."
		exit
fi

if((OPTION>=1 && OPTION<=ITERATOR))
	then
		SCRIPTTORUN=${PROGRAMS[(( OPTION - 1 ))]}
		chmod 755 $SCRIPTTORUN
		$SCRIPTTORUN install
		exit
fi

echo $OPTION
if [[ "$OPTION" == u* ]];  
then
	OPTION=$(echo $OPTION | cut -d'u' -f2)

	if((OPTION>=1 && OPTION<=ITERATOR))
	then
		SCRIPTTORUN=${PROGRAMS[(( OPTION - 1 ))]}
		chmod 755 $SCRIPTTORUN
		$SCRIPTTORUN uninstall
		exit
	fi
fi

echo "Opción no valida."
