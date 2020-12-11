# Ciclo de vida de los objetos en S3

author: jhosef@trambo.cloud


## Desde AWS CLI
Se pueden crear las reglas de ciclo de vida desde la consola de amazon

## Requisitos 

- Tener instalado AWS Cli
- Tener los permisos necesarios para administrar los bucket en s3
- Para ejecutar aws s3api se necesita AWS Cli V2

## Corroborar si existen reglas asociadas

Para verificar qué buckets tienen reglas asociadas, se puede utilizar el script `listBucketWithRuls.sh `

Ejecutar el comando


```
$ ./listBucketWithRuls.sh

```


## Pasos 

### Paso 1

Crear un archivo json con la definición de las reglas, también puede ser un archivo en formato xml

Con el archivo, como en este caso [general-rule.json](general-rule.json) se definen las reglas y los períodos de tiempo para cambiar de una clase de almacenamiento a otra, por ejemplo:

```
"Transitions": [
    {
        "Days": 60,
        "StorageClass": "GLACIER"
    },
    {
        "Days": 365,
        "StorageClass": "GLACIER"
    }
],
```

### Paso 2
Corroboramos si existen reglas ya creadas en los bucket

Comando para verificar si existe una regla asociada a un bucket, por ejemplo:

```
aws s3api get-bucket-lifecycle-configuration --bucket  ndiariovpc

```

## Paso 3
Comando para enviar la regla a un bucket en específico

```
aws s3api get-bucket-lifecycle-configuration --bucket  ndiariovpc

```
 ## Paso 4
 Para ejecutar el escript que configure una regla en todos los buckets que hay en s3, excepto los buckets que ya tienen reglas de ciclo de vida


```
$ ./setLifecycleRule.sh

```
