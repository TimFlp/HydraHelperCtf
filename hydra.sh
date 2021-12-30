#!/bin/sh

Init (){
read -p "Login : " log
read -p "Cible : " cible
}

Choix (){
echo -e "\e[32mQuelle plateforme ?\e[0m"
echo ""
echo -e "ssh : 1\nftp : 2\nhttp-POST-form : 3\nhttp-GET-form : 4\nRDP : 5\nSMB : 6 "
echo ""
read -p 'Choix : ' selec
}

Platforme (){

if [ $selec -eq 1 ];then
	echo -e 'Plateforme choisie : \e[32mssh\e[0m\nCommande lancée : hydra -t 4 -l '$log' -P /usr/share/wordlists/rockyou.txt -vV '$cible' ssh'
	sleep 2
	hydra -t 4 -l $log -P /usr/share/wordlists/rockyou.txt -vV $cible ssh
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "
	sleep 120

elif [ $selec -eq 2 ];then
	echo -e 'Plateforme choisie : \e[32mftp\e[0m\nCommande lancée : hydra -t 1 -l '$log' -P /usr/share/wordlists/rockyou.txt -vV '$cible' ftp'
	sleep 2
	hydra -t 1 -l $log -P /usr/share/wordlists/rockyou.txt -vV $cible ftp
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "
	sleep 120

elif [ $selec -eq 3 ];then
	echo -e 'Plateforme choisie : \e[32mhttp-POST-form\e[0m'
	echo -e "Le message d'erreur représente la phrase qui s'affiche lorsque la tentative de connexion échoue."
	read -p "Message d'erreur : " err
	echo -e 'Commande lancée : hydra -l '$log' -P /usr/share/wordlists/rockyou.txt '$cible' http-post-form''/login:username=^USER^&password=^PASS^:F='$err''
	sleep 2
	hydra -l $log -P /usr/share/wordlists/rockyou.txt $cible http-post-form "/login:username=^USER^&password=^PASS^:F=$err" -V
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "
	sleep 120

elif [ $selec -eq 4 ];then
	echo -e 'Plateforme choisie : \e[32mhttp-GET-form\e[0m'
        echo -e "Le message d'erreur représente la phrase qui s'affiche lorsque la tentative de connexion échoue."
        read -p "Message d'erreur : " err
        echo -e 'Commande lancée : hydra -l '$log' -P /usr/share/wordlists/rockyou.txt '$cible' http-get-form''/login:username=^USER^&password=^PASS^:F='$err''
	sleep 2
        hydra -l $log -P /usr/share/wordlists/rockyou.txt $cible http-post-form "/login:username=^USER^&password=^PASS^:F=$err" -V
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "	
	sleep 120

elif [ $selec -eq 5 ];then
	echo -e 'Plateforme choisie : \e[32mRDP\e[0m\nCommande lancée : hydra -t 1 -V -f -l '$log' -P /usr/share/wordlists/rockyou.txt -vV rdp://'$cible''
	sleep 2
	hydra -t 1 -V -f -l $log -P /usr/share/wordlists/rockyou.txt -vV rdp://$cible
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "
	sleep 120

elif [ $selec -eq 6 ];then
	echo -e  'Plateforme choisie : \e[32mSMB\e[0m\nCommande lancée : hydra -t 1 -V -f -l '$log' -P /usr/share/wordlists/rockyou.txt -vV '$cible' smb'
	sleep 2
	hydra -t 1 -V -f -l $log -P /usr/share/wordlists/rockyou.txt -vV $cible smb
	echo "Le programme se ferme dans 2 minutes, pensez à sauvegarder le login ! "
	sleep 120
else
	echo -e  'Entrée non conforme.\nArrêt du programme.'
	sleep 3
	exit 1
fi
}

clear ##Pour enlever la demande de mot de passe sudo ## 

echo -e  "\e[32mUtilitaire pour Hydra, utilise automatiquement la wordlist RockYou.txt\e[0m"
echo -e  "\e[32mEcrit par TimFlp, Pour simplifier les CTF :)\e[0m "
Init
clear

Choix
clear

Platforme
clear









