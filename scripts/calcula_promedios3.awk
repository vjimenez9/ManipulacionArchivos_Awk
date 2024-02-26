BEGIN{prom=0; promGen=0} 
  { prom = ( $2 + $3 + $4)/3;  
    if( prom >= 70.0 ){
    	print $1, "promedio :", prom >> "Aprobados.txt"
    }else{
        print $1, "promedio :", prom >> "Reprobados.txt"	 
    }
    promGen=promGen+prom
  }
END {print "Promedio General", (promGen/NR)}
