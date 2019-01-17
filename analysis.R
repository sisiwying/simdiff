args=(commandArgs(TRUE))

if(length(args)==0)
{
    print("No input file supplied.")
}else{
	x<-read.csv(args[2], sep=" ", header=F)
	y<-as.matrix(x)

	Sigma<-var(y)

	outfile_Sigma = paste0(args[3], "_Sigma.txt")
	outfile_mu = paste0(args[3], "_mu.txt")

	if(file.exists(outfile_Sigma) || file.exists(outfile_mu))
	{
		print("Output file exist. Please rename the output file and run again.")	
	}else{
		for(i in 1:length(Sigma[,1]))
		{
			cat(Sigma[i,], "\n", file=outfile_Sigma, append=T)
		}

		for(i in 1:length(y[1,]))
		{
			cat(mean(y[,i]),"\n", file=outfile_mu, append=T)
		}
	}
}
