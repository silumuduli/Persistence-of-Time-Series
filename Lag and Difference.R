
# n=lag
# d= order of difference
# x= vector
L=function(x,n){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(stats,dplyr)
  x=c(dplyr::lag(x,n))
  return(x)
}

F=function(x,n){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(stats,dplyr)
  x=c(dplyr::lead(x,n))
  return(x)
}


D=function(x,n,d){
  if (!require(pacman)) install.packages("pacman")
  pacman::p_load(base)
  x=c(rep(NA,max(d,n)), base::diff(x,lag=n, differences=d))
  return(x)
}
