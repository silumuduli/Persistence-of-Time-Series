if (!require(pacman)) install.packages("pacman")
pacman::p_load(tseries, tvReg, TSstudio, forecast, tibbletime, roll, gganimate, gapminder, rmdformats, ggpubr,ggplot2,readxl,RColorBrewer,data.table,astsa, foreign, haven,utils,changepoint,openxlsx,tsDyn,urca,KFAS,lubridate,forecast,vars,dplR, ggfortify)




#### TIME SERIES PLOT ####

data=read.xlsx("https://mudulisilu.files.wordpress.com/2021/11/tsdata.xlsx")

arima_plot=function(x,year,number,varname, freq,conf_level, forecast_horizon){
  xts=ts(x, start = c(year,number),frequency = freq)
  arima_m <- auto.arima(xts)
  summary(arima_m)
  forecast_arima <- forecast(arima_m, level = c(conf_level), h =forecast_horizon)
  autoplot(forecast_arima)+theme_bw()+ylab(varname)
}



# An Example
x=data$GDPGrowth
varname=c("GDP Growth")
year=2007
number=3 # month number or quarter number
freq=4 # for monthly data=12, quarterly data=4, annual data=1
conf_level=95
forecast_horizon=12
arima_plot(x,year,number,varname, freq,conf_level, forecast_horizon)