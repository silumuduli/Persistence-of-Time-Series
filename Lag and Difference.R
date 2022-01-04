
# n=lag
# d= order of difference
# x= vector
L=function(x,n){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(stats)
  x=c(Lag(x,n))
  return(x)
}


D=function(x,n,d){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(stats)
  x=c(rep(NA,max(d,n)), diff(x,lag=n, differences=d))
  return(x)
}
