{ for (i=1; i<=NF; i++)
	sum[i] += $i
	if  (NF > maxfld)
		maxfld = NF
}
END { for (i=1;i<=maxfld;i++) {
       printf("%d", sum[i])
	    if (i<maxfld)
          printf("\t")
       else
          printf("\n")
	     }

    }
