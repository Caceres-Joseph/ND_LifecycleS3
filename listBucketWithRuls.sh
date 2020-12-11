#!/bin/bash


echo "Mostrando todos los buckets con reglas asociadas"
echo "------------------------------------------------"



#Si se usa el perfil por defecto, borrar el tag --profile
aws s3 ls --profile $1 | while read -r F
do
  aws s3api get-bucket-lifecycle-configuration --bucket  ${F:20} --profile $1 > /dev/null 2>&1

  if [[ $(echo $?) -eq 0 ]]; then
      echo ${F:20} 
  fi
done