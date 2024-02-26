############################
# codigo 1.  Para empezar…
############################

# genere una carpeta llamada curso_awk: 

mkdir curso_awk

# Localice la carpeta data y dentro de la carpeta curso_awk genere una liga a la carpeta  data:

cd curso_awk
ln -s /Data/Semana1/Modulo_awk/*.*  .


################################
# Codigo 2. Ejecutando awk
################################
awk '/gene/'  data/TAIR10_genomic.gff


################################
# codigo 5. ejemplo
################################

awk '/bar/' data/Expresiones1.txt

################################
# codigo 6. ejemplo
################################

awk '{print "Hola Mundo"}' data/Expresiones1.txt

################################
# # codigo 7. El uso de las millas. 
################################
#. Si quitamos las comillas considera que Hola y Mundo son variables vacias y no imprime nada

awk '{print Hola Mundo}' data/Expresiones1.txt


# Hay que prestar atencion a las comillas:  

awk ’{print “Don’t worry”}’ data/Expresiones1.txt

################################
# # codigo 8. El uso de las millas. 
################################
#¿Como podemos solucionarlo?:
#Sol 1:  cambiando la comilla despues de la n
awk '{print "Don`t worry"}' data/Expresiones1.txt

#Sol 2: escapando con backslash fuera de las comillas
awk '{print "Don'\''t worry"}' data/Expresiones1.txt


################################
# Codigo 9. ejemplo
################################

################################
# Codigo 10. ejemplo
################################
awk '{print FILENAME, $1, FNR, NR}' data/mail-list  data/Inventory-shipped

################################
# Codigo 11. diviendo Registros
################################

awk 'BEGIN{RS=">"}
          {print NR,$0}' uniprot_sprot.fasta



################################
# codigo 12. ejemplo
################################
echo "Esto parece ser un buen ejemplo" | awk '{print "primer campo: ",$1, "utimo:",$NF}'


################################
# Codigo 13. Pruebe los siguientes codigos
################################
#El archivo campos.awk, contiene las siguientes lineas…
more data/codigo.awk

# Y podemos ejecutarlo invocando asi:
echo "algo" | awk -f data/campos.awk 

################################
# Codigo 14
################################
echo a b c d | awk '{ OFS = ":";  $2 = "";  print $0; print NF }'

################################
# Codigo 15
################################

echo a b c d | awk '{ OFS = ":"; $2 = ""; $6 = "new"
    print $0; print NF }'

################################
# Codigo 16.  Separadores
################################
echo a b c d | awk '{print $1, $2, $3,$4}'  
echo a b c d | awk '{print $1 $2 $3 $4}'  
echo a b c d | awk '{print}'
echo a b c d | awk 'BEGIN{OFS = "+"}{print $1,$2,$3,$4}'

################################
# Codigo 17.  Revisando el contenido del archivo
################################

more mail-list

################################
# Codigo 18.  Redireccionando salida
################################

awk '{ print $2 > "phone-list"
            print $1 > "name-list" }' data/mail-list 

awk '{ print $2 >> "phone-list"
            print $1 >> "name-list" }' data/mail-list 

awk '{ print $1 > "names.unsorted” 
       command = "sort -r > names.sorted"
       print $1 | command }' data/mail-list

################################
# Codigo 19. 
################################

awk '{matches=/con/; print matches}'  data/Expresiones1.txt

################################
# codigo 20.
################################

# La siguiente linea no se comporta como esperamos: 
awk '/con/ ~ $1 { print }'  data/Expresiones1.txt

# La manera correcta es esta:
awk '$1 ~/con/ { print }'  data/Expresiones1.txt

# Y es distinta a esta otra:

awk '/con/ { print }'  data/Expresiones1.txt

################################
# Codigo 21
################################
#. 
awk '$0 ~ /edu/ && $0 ~ /li/ { print } ' Expresiones1.txt

echo "ABC"  "abc"| awk '{ print ($1 < $2 && $1 != $2) ? "true" : "false" }'

echo "abc"  "ABC"| awk '{ print ($1 < $2 && $1 != $2) ? "true" : "false" }'


################################
# Codigo 22
################################
#. 

# Las siguientes dos instrucciones son equivalentes
awk  '$0 ~ /barfly/ || $0 ~ /camelot/ { print }’  data/Expresiones1.txt

awk  '/barfly/ || /camelot/ {print}'  data/Expresiones1.txt

# La sigueinte instruccion no escibe nada porque ninguna linea cumple simultaneamente 
# tener ambas palabras
awk  '/barfly/ && /camelot/ {print}'  data/Expresiones1.txt

#este comando  imprime las lineas que tienen con y palabra simultaneamiente. 
awk  '/con/ && /palabra/ {print}'  data/Expresiones1.txt


################################
# Codigo 23. ejercicios
################################

#1. A partir del archivo  data/Expresiones1.txt, genere el un programa awk  para 
# imprimir exclusivamente  las líneas que inician con la palabra “con”
#opcion 1:
 awk '$1 ~/con/ { print }'  data/Expresiones1.txt
#opcion 2:
 awk '/^con/{print}' Dropbox/cursos_uuab/awk/data/Expresiones1.txt

#2. Un programa awk que imprima todas las lineas que terminan con la letra “a”
awk '/a$/{print}' Dropbox/cursos_uuab/awk/data/Expresiones1.txt



################################
# Codigo 24. Solución
################################

# Trabajemos con el archivo Expresiones1.txt como archivo de entrada
# Podemos iniciar revisando el contenido del archivo Expresiones1.txt:
more Expresiones1.txt

#1. Genera un awk que imprime el numero de campos por linea, en el archivo Expresiones1.txt
awk '{print NF}'  Expresiones1.txt 
#2. Genera un awk que imprima el numero de campos por linea,si consideramos el tabulador como separador en el archivo Expresiones1.txt
awk -F"\t" '{print NF}'  Expresiones1.txt 
#3. Genera un awk que imprima el contendio del ultimo campo por linea, considerando como separador un espacio en blanco
awk '{print $NF}'  data/Expresiones1.txt 

#4. Genera un awk que Imprimir el primer campo, antecedido por el numero de renglón.
awk '{print NR,$1}'  data/Expresiones1.txt 

################################
# Codigo 25. Solución a los ejercicios
################################
# El archivo GCF_000001405.30_GRCh38.OnlyTranscript.gff, ¿ tiene formato de GFF (es
# decir, 9 columnas separadas por un tabulador? 
awk  -F"\t" '{print NF}' data/homo_sapiens.OnlyTranscript.gff | sort | uniq -c

# ¿qué contiene la ultima columna?
awk  -F"\t" '{print $NF}' data/homo_sapiens.OnlyTranscript.gff | more

#¿Que gen esta escrito en el registro 74815? 
awk 'NR == 74815' data/homo_sapiens.OnlyTranscript.gff 

################################
# Codigo 26. Variables
################################

awk -v n=2 '{ print $n }'  data/Inventory-shipped  data/mail-list

awk '{ print $n }' n=4 data/inventory-shipped n=2 data/mail-list

################################
# Codigo 27. conversiones de cadenas y numeros
################################

# ¿cuál supones será el resultado de la siguiente operación? 

awk 'BEGIN{two = 2; three = 3
> print (two three) + 4
> }' -

#Respuesta: 27, porque se concatena el 2 y el 3 resultado 23 + 4 = 27

################################
# Codigo 28. Conversiones de cadenas a numeros
################################

echo "" | awk '{valor="1E3"; print valor+1}'

$ echo "" | awk '{valor="2.5"; print valor+1}'

$ echo "" | awk '{valor="25fix"; print valor+1}'

$ echo "" | awk '{valor="hola"; print valor+1}'


################################
# Codigo 29. Respuesta a Ejercicios
################################
# 1. imprime el resultado de Dividir la columna 5 entre la columna $4, para todos lor registros donde existan estas columnas para el archivo Inventory-shipped

awk 'NF>4{print $5/$4}' data/Inventory-shipped

# Imprime solo los registros pares del archivo mail-list:

awk 'NR % 2 == 0'  data/mail-list

################################
# Codigo 30. Respuesta a Ejercicios
################################

#1. El archivo grades,  contiene una lista de nombres y las calificaciones 
#   correspondientes a 3 periodos de evaluación.  Imprime el nombre de cada 
#  participante, seguido de su promedio de calificación.  Al final del archivo, imprime 
# el promedio del grupo. 
 awk -F"\t" '{ sum = $2 + $3 + $4 ; avg = sum / 3; promedio+=avg; print $1, avg} 
        END { print "Promedio General del grupo:", promedio/8}' data/grades

# 2.El archivo bad.fasta,  no inicia cada nombre de secuencia con el simbolo “>” . Lo que 
# sabemos de cierto es que todos los renglones impares son nombres de secuencias y los 
# pares, sus secuencias correspondientes, agrega el signo “>”  y guarda la salida en un 
# nuevo archivo good.fasta
awk 'NR % 2 == 1{print ">" $0} NR % 2 == 0 {print }'  data/bad.fasta > good.fasta

# 3.Un archivo fastq, tiene 4 renglones por secuencia:
# El nombre de la secuencia
# La secuencia propiamente
# Otra vez el nombre de la secuencia
# Calidad de la secuencia.  
# A partir de este archivo, genera un archivo en formato fasta

awk 'NR % 4 == 1{sub("@",">"); print } NR % 4 == 2 {print }'  data/Illumina.Single.fastq > salida.fasta


################################
# Codigo 31. concatenando Cadenas
################################

# Esto marcara un error:
awk '{file = "file"
name = "name"
print "something meaningful" > file name}' data/grades

# Corrigiendo el error:
awk '{file = "file"
name = "name"
print "something meaningful" > (file name)}' data/grades


################################
# codigo 32. Operador de Asignacion
################################

echo "" | awk '{cosa = "comida "
      adjetivo = "buena "
      mensaje = "Esta " cosa " es " adjetivo
      print mensaje}'



################################
# Codigo 33. ¿Que valores se imprimen?
################################

# En este caso primero se asigna luego se incrementa, por lo tanto a y b tienen valores distintos. 
echo “” | awk '{b = 6
   print a = b++
   print a,b
}’

# En este caso primero se incrementa y luego se asigna, por lo tanto a y b tienen valores  iguales. 

echo "" | awk '{b = 6
   print a = ++b
   print a,b
} ' 

################################
# Codigo 34. Operadores relacionales
################################
# Que imprimirá el sigueinte codigo:

echo "ABC"  "abc"| awk '{ print ($1 < $2) ? "true" : "false" }'

echo "abc"  "ABC"| awk '{ print ($1 < $2) ? "true" : "false" }'


################################
# Codigo 35. ¿A cuanto evaluan las siguientes expresiones?
################################
echo "" |awk '{resul = 5+4*2 - 10/2; print resul}'

echo ""| awk 'BEGIN{ A=0; B=1; C=2}{resul= B < C && B < A || A!=C; print resul}'

echo ""| awk 'BEGIN{ A=0; B=1; C=2}{resul= B < C && (B < A || A!=C); print resul}'

################################
# Codigo 36. Verificando elementos en un arreglo
################################
$ more arreglo.awk

echo "" | awk -f arreglo.awk

################################
# Codigo 37.  La funcion split
################################

# Tomamos solo los renglones que pertenecen a genes,  tomamos su columna 9, 
# y dividimos sus campos usando la función split, con el delimitador ;.  
# Imprimimos el tercer campo que tiene el nombre.
# Los campos 4 y 5 tienen las coordenadas y el 7 el strand. 

awk -F"\t" '$3 ~ /gene/{ split($9,a,";"); print a[3],$4,$5,$7}' data/TAIR10_genomic.gff | more

################################
# codigo 38. función gsub
################################
# Utilizando la función gsub para substituir una cadena por otra: 
echo "Cambridge is a university in Britain" | awk '{ gsub(/Britain/, "United Kingdom"); print }'

# O para eliminar una cadena:
awk -F"\t" '$3 ~ /gene/{ split($9,a,";"); gsub("Name=","", a[3]);print a[3],$4,$5,$7}' data/TAIR10_genomic.gff | more 

################################
# # Codigo 39. Ejercicio Final
################################



