
> library(readxl)
> Ipca <- read_excel("C:/EconometriaA/Ipca.xlsx", 
                     +     col_types = c("blank", "numeric"))
`col_type = "blank"` deprecated. Use "skip" instead.
> View(Ipca)
> plot(Ipca$IPCA)
> plot(Ipca$IPCA, type = "l")
> dados <- ts(Ipca, start = 2015, frequency = 12)
> plot(dados, main="IPCA", xlab="Ano")
> View(dados)
> install.packages("urca")
Installing package into 'C:/Users/Alunos/Documents/R/win-library/3.5'
(as 'lib' is unspecified)
trying URL 'https://cran.rstudio.com/bin/windows/contrib/3.5/urca_1.3-0.zip'
Content type 'application/zip' length 1060448 bytes (1.0 MB)
downloaded 1.0 MB

package 'urca' successfully unpacked and MD5 sums checked

The downloaded binary packages are in
C:\Users\Alunos\AppData\Local\Temp\RtmpExw79B\downloaded_packages
> library("urca")
> library(readxl)
> TesteDF_Variacao_none <- ur.df(Ipca, "none",lags = 0)
Error in embed(z, lags) : 'x' is not a vector or matrix
> TesteDF_Ipca <- ur.df(IPCA, type = "none",lags = 1)
Error in as.matrix(y) : object 'IPCA' not found
> TesteDF_Ipca <- ur.df(Ipca, type = "none",lags = 1)
Error in embed(z, lags) : 'x' is not a vector or matrix
> TesteDF_Ipca <- ur.df(Ipca, type = "none",lags = 0)
Error in embed(z, lags) : 'x' is not a vector or matrix
> TesteDF_Ipca <- ur.df(IPCA, "none",lags = 0)
Error in as.matrix(y) : object 'IPCA' not found
> TesteDF_Ipca <- ur.df(data,"none",lags = 0)
Error in as.vector(x, mode) : 
  cannot coerce type 'closure' to vector of type 'any'
> TesteDF_Ipca <- ur.df(IPCA, type = "none",lags = 1)
Error in as.matrix(y) : object 'IPCA' not found
> dados_mensais<-ts(IPCA,start = 2015/01/01,frequency = 12)
Error in is.data.frame(data) : object 'IPCA' not found
> dados_mensais<-ts(Ipca,start = 2015/01/01,frequency = 12)
> TesteDF_Ipca <- ur.df(dados_mensais, "none",lags = 0)
> View(TesteDF_Ipca)
> summary(TesteDF_Ipca)

############################################### 
# Augmented Dickey-Fuller Test Unit Root Test # 
############################################### 

Test regression none 


Call:
  lm(formula = z.diff ~ z.lag.1 - 1)

Residuals:
  Min       1Q   Median       3Q      Max 
-0.74921 -0.12279  0.04407  0.20001  0.95902 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)
z.lag.1 -0.08793    0.07944  -1.107    0.275

Residual standard error: 0.3155 on 42 degrees of freedom
Multiple R-squared:  0.02834,	Adjusted R-squared:  0.005207 
F-statistic: 1.225 on 1 and 42 DF,  p-value: 0.2747


Value of test-statistic is: -1.1068 

Critical values for test statistics: 
  1pct  5pct 10pct
tau1 -2.62 -1.95 -1.61

> acf(Ipca$Ipca, main="Inflacao Mensal")
Error in ts(x) : 'ts' object must have one or more observations
In addition: Warning message:
  Unknown or uninitialised column: 'Ipca'. 
> acf(IPCA$Ipca, main="Inflacao Mensal")
Error in as.ts(x) : object 'IPCA' not found
> acf(Ipca$IPCA, main="Inflacao Mensal")
> acf(Ipca$IPCA, main="IPCA Mensal")
> pacf(Ipca$IPCA, main="IPCA Mensal")
> AR1 <- arima(Ipca, order = c(1,0,0))
> AR1

Call:
  arima(x = Ipca, order = c(1, 0, 0))

Coefficients:
  ar1  intercept
0.6643     0.5070
s.e.  0.1217     0.1259

sigma^2 estimated as 0.08558:  log likelihood = -8.64,  aic = 23.28
> MA1 <- arima(Inflacao,order=c(0,0,1))
Error in NCOL(x) : object 'Inflacao' not found
> MA1 <- arima(Ipca,order=c(0,0,3))
> MA <- arima(Inflacao,order=c(0,0,3))
Error in NCOL(x) : object 'Inflacao' not found
> MA1 <- arima(Ipca,order=c(0,0,1))
> MA2 <- arima(Ipca,order=c(0,0,2))
> MA3 <- arima(Ipca,order=c(0,0,3))
> MA1

Call:
  arima(x = Ipca, order = c(0, 0, 1))

Coefficients:
  ma1  intercept
0.5290     0.5043
s.e.  0.1102     0.0723

sigma^2 estimated as 0.09977:  log likelihood = -11.89,  aic = 29.78
> MA2

Call:
  arima(x = Ipca, order = c(0, 0, 2))

Coefficients:
  ma1     ma2  intercept
0.6414  0.2692     0.4989
s.e.  0.1489  0.1390     0.0862

sigma^2 estimated as 0.09186:  log likelihood = -10.13,  aic = 28.26
> MA3

Call:
  arima(x = Ipca, order = c(0, 0, 3))

Coefficients:
  ma1     ma2     ma3  intercept
0.5929  0.3342  0.2357     0.5002
s.e.  0.1649  0.1659  0.2437     0.0959

sigma^2 estimated as 0.08946:  log likelihood = -9.57,  aic = 29.14
> ARMA11 <- arima(Ipca,order = c(1,0,1))
> ARMA12 <- arima(Ipca,order = c(1,0,2))
> ARMA13 <- arima(Ipca,order = c(1,0,3))
> ARMA11

Call:
  arima(x = Ipca, order = c(1, 0, 1))

Coefficients:
  ar1      ma1  intercept
0.7839  -0.2079     0.5183
s.e.  0.2081   0.3563     0.1531

sigma^2 estimated as 0.08478:  log likelihood = -8.46,  aic = 24.93
> ARMA12

Call:
  arima(x = Ipca, order = c(1, 0, 2))

Coefficients:
  ar1      ma1      ma2  intercept
0.9390  -0.3699  -0.2468     0.5674
s.e.  0.0821   0.1769   0.1569     0.2211

sigma^2 estimated as 0.08137:  log likelihood = -7.68,  aic = 25.35
> ARMA13

Call:
  arima(x = Ipca, order = c(1, 0, 3))

Coefficients:
  ar1      ma1      ma2      ma3  intercept
0.9408  -0.3659  -0.2424  -0.0177     0.5652
s.e.  0.0810   0.1786   0.1602   0.1650     0.2213

sigma^2 estimated as 0.08136:  log likelihood = -7.67,  aic = 27.34
> estimacoes<-list(AR1,MA1,MA2,MA3,ARMA11,ARMA12,ARMA13)
> sapply(estimacoes,AIC)
[1] 23.28383 29.78088 28.26373 29.13587 24.92927 25.35362 27.34218
> sapply(estimacoes,BIC)
[1] 28.63640 35.13345 35.40049 38.05682 32.06603 34.27456 38.04732
> AIC<-sapply(estimacoes,AIC)
> BIC<-sapply(estimacoes,BIC)
> Modelo<-c("AR1","MA1","MA2","MA3","ARMA11","ARMA12","ARMA13")
> Resultados<-data.frame(modelo,AIC,BIC)
Error in data.frame(modelo, AIC, BIC) : object 'modelo' not found
> Resultados<-data.frame(Modelo,AIC,BIC)
> View(Resultados)
> 