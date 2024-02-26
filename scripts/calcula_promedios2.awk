BEGIN{prom=0; promGen=0} 
  { prom=( $2 + $3 + $4)/3;  
    print $1, "promedio :", prom;	 
    promGen=promGen+prom
  }
END {print "Promedio General", (promGen/NR)}
