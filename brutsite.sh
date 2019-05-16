#!/bin/bash
for palavra in $(cat /usr/share/dirb/wordlists/small.txt)
do
resposta=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra/)
if [ $resposta == "200" ]
then
echo "Diretorio encontrado: $palavra" 
fi
resposta2=$(curl -s -o /dev/null -w "%{http_code}" $1/$palavra)
if [ $resposta2 == "200" ]
then
echo "Arquivo encontrado $palavra"
fi
done
