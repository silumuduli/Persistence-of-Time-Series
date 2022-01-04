if (!require(pacman)) install.packages("pacman")
pacman::p_load(tseries, tvReg, TSstudio, forecast, tibbletime, roll, gganimate, gapminder, rmdformats, ggpubr,ggplot2,readxl,RColorBrewer,data.table,astsa, foreign, haven,utils,changepoint,openxlsx,tsDyn,urca,KFAS,lubridate,forecast,vars,dplR, ggfortify)




#### TIME SERIES PLOT ####

data=read.xlsx("https://mudulisilu.files.wordpress.com/2021/11/tsdata.xlsx")

var_plot=function(d,year,number,freq,forecast_horizon){
  
  datats=ts(d, start = c(year,number),frequency = freq)
  lag_select <- VARselect(datats, lag.max = 5, type = 'const')$selection[1]
  var_m <- VAR(datats, p =lag_select, type = 'const')
  autoplot(predict(var_m, n.ahead =forecast_horizon), ts.colour = 'dodgerblue4',predict.colour = 'blue', predict.linetype = 'dashed')+theme_bw()
  
}


# An Example
x1=data$GDPGrowth
x2=data$GFCFGrowth
d=data.frame(x1,x2)
colnames(d)=c("GDP Growth", "Capital Formation")
year=2007
number=3 # month number or quarter number
freq=4 # for monthly data=12, quarterly data=4, annual data=1
forecast_horizon=4
var_plot(d,year,number,freq,forecast_horizon)
