#!/bin/bash


echo "Agregando regla a los siguientes buckets"
echo "------------------------------------------------"

#Si se usa el perfil por defecto, borrar el tag --profile
aws s3 ls --profile trambo | while read -r F
do
  aws s3api get-bucket-lifecycle-configuration --bucket  ${F:20} --profile trambo > /dev/null 2>&1

    if [[ $(echo $?) -ne 0 ]]; then

        echo ${F:20}
        #aws s3api put-bucket-lifecycle --bucket ${F:20} --lifecycle-configuration file://general-rule.json
        aws s3api put-bucket-lifecycle-configuration --bucket ${F:20} --lifecycle-configuration  file://general-rule.json --profile trambo
    fi
done