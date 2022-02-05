
irf_plot=function(irf,ylab="Response",xlab="Horizon"){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(ggplot2) 
irfd=data.frame(y=irf$irf,l=irf$Lower,u=irf$Upper)
colnames(irfd)=c("y","l","u")
irfd$Horizon=1:length(rownames(irfd))
p=ggplot(irfd, aes(Horizon))+geom_ribbon(aes(ymin =l, ymax =u), fill = "grey60",alpha=0.4) + theme_bw()+geom_line(aes(y = y), col="darkcyan", size=1)+geom_line(aes(y = 0), col="black", size=1,linetype="dashed")+xlab(xlab)+ylab(ylab)
return(p)
}

#vecdata=data.frame(data$GDPGrowth,data$GFCE,data$GFCF)
#colnames(vecdata)=c("A","B","C")


#mod_VECM <- VECM(vecdata, lag =3, estim="ML", r=1)
#irf=irf(mod_VECM, impulse = "A", response ="A", boot =T,ci = 0.95, n.ahead = 40,runs=100)
