if (!require(pacman)) install.packages("pacman")
pacman::p_load(tseries, tvReg, TSstudio, forecast, tibbletime, roll, gganimate, gapminder, rmdformats, ggpubr,ggplot2,readxl,RColorBrewer,data.table,astsa, foreign, haven,utils,changepoint,openxlsx,tsDyn,urca,KFAS,lubridate,forecast,vars,dplR, ggfortify)




#### TIME SERIES PLOT ####

data=read.xlsx("https://mudulisilu.files.wordpress.com/2021/11/tsdata.xlsx")

tseries_plot=function(d,year,number,freq){
  
  datats=ts(d, start = c(year,number),frequency = freq)
  autoplot(datats, facets = FALSE)+theme_bw()+theme(legend.position = c(0.8, 0.8))+scale_colour_discrete(name="")+ylab("")
  
}


# An Example
x1=data$GDPGrowth
x2=data$GFCFGrowth
d=data.frame(x1,x2)
colnames(d)=c("GDP Growth", "Capital Formation")
year=2007
number=3 # month number or quarter number
freq=4 # for monthly data=12, quarterly data=4, annual data=1
tseries_plot(d,year,number,freq)
