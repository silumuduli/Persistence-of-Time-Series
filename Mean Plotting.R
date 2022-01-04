if (!require(pacman)) install.packages("pacman")
pacman::p_load(tseries, tvReg, TSstudio, forecast, tibbletime, roll, gganimate, gapminder, rmdformats, ggpubr,ggplot2,readxl,RColorBrewer,data.table,astsa, foreign, haven,utils,changepoint,openxlsx,tsDyn,urca,KFAS,lubridate,forecast,vars,dplR, ggfortify)




#### TIME SERIES PLOT ####

data=read.xlsx("https://mudulisilu.files.wordpress.com/2021/11/tsdata.xlsx")

mean_plot=function(x,year,number,freq,varname){
  xts=ts(x, start = c(year,number),frequency = freq)
  mean <- cpt.mean(xts, penalty = "BIC", method = "PELT")
  autoplot(mean)
  plot(mean,cpt.col = "maroon", xlab = "Time", cpt.width = 2)
}


# An Example
x=data$GDPGrowth
varname=c("GDP Growth")
year=2007
number=3 # month number or quarter number
freq=4 # for monthly data=12, quarterly data=4, annual data=1

mean_plot(x,year,number, freq, varname)