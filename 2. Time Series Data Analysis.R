#============================================================================================
library(tseries)
library(forecast)
library(lmtest)
library(car)
library(readxl)
library(ggplot2)
#--------------------------1. input data
term <- read_excel("D:/Doc Tiara L.A/STATISTICAT/3. Time Series Suhu/Data/Data Suhu.xlsx", 
                        sheet = "Ter")
View(term)
term$Tanggal <- as.Date(term$Tanggal)
term$`T Avg` <- as.numeric(term$`T Avg`)
term$Kel_T <- as.factor(term$Kel_T)
str(term)

#-------------------------2. membagi data training:testing -> 90%:10%
train.term <- term$`T Avg`[1:328]
test.term <- term$`T Avg`[329:364]

#-------------------------3. uji stasioner
#stasioner dalam rataan
adf.test(train.term) #stasioner
#stasioner dalam ragam
leveneTest(train.term~term$Kel_T[1:328]) #stasioner

#-------------------------4. identifikasi model ARIMA 
par(mfrow=c(1,2))
acf(train.term) #cuts off = 1,2,4
pacf(train.term) #cuts off = 1

#----------------5. estimasi parameter model
#ARIMA(1,0,0)
fitm1 <- Arima(train.term, order = c(1,0,0), method = "CSS-ML")
coeftest(fitm1) #signifikan
summary(fitm1) #AIC=855.04   AICc=855.11   BIC=866.42

#ARIMA(1,0,2)
fitm2 <- Arima(train.term, order = c(1,0,2), method = "CSS-ML")
coeftest(fitm2) #signifikan
summary(fitm2) #AIC=852.33   AICc=852.52   BIC=871.29

#ARIMA(1,0,4)
fitm3 <- Arima(train.term, order = c(1,0,4), method = "CSS-ML")
coeftest(fitm3) #tidak signifikan

#ARIMA(1,0,1)
fitm4 <- Arima(train.term, order = c(1,0,1), method = "CSS-ML")
coeftest(fitm4) #tidak signifikan

#----------------6. Uji diagnostik model tentatif awal
#uji asumsi residual tidak berkorelasi (H0 harus diterima)
#----ARIMA(1,0,2) 
par(mfrow=c(1,1))
ts.plot(fitm2$residuals)
res2 <- (fitm2$residuals)
Box.test(res2, type = "Ljung-Box") #pval=0.9512
Box.test(res2, lag = 6, type = "Ljung") #0.9911
Box.test(res2, lag = 12, type = "Ljung") #0.9077
Box.test(res2, lag = 18, type = "Ljung") #0.9488
Box.test(res2, lag = 24, type = "Ljung") #0.8838

#----ARIMA(1,0,0) 
ts.plot(fitm1$residuals)
res1 <- (fitm1$residuals)
Box.test(res1, type = "Ljung-Box") #pval=0.8518
Box.test(res1, lag = 6, type = "Ljung") #0.3784
Box.test(res1, lag = 12, type = "Ljung") #0.3158
Box.test(res1, lag = 18, type = "Ljung") #0.5508
Box.test(res1, lag = 24, type = "Ljung") #0.4548

#Berdasarkan uji diagnostik dan nilai AIC BIC, maka dipilih ARIMA(1,0,2) sebagai model terbaik
#--------------------------7. overfitting model ARIMA(1,0,2) 
#ARIMA(1,0,3)
ov1 <- Arima(train.term, order = c(1,0,3), method = "CSS-ML")
coeftest(ov1) #tidak signifikan

#ARIMA(2,0,2)
ov2 <- Arima(train.term, order = c(2,0,2), method = "CSS-ML")
coeftest(ov2) #tidak signifikan

#--------------------------8. peramalan untuk data training dengan ARIMA(1,0,2)
predtrain <- (fitm2$fitted) 
accuracy(predtrain,train.term)
df <- as.data.frame(as.Date(term$Tanggal[1:328]))
df$aktual <- as.numeric(term$`T Avg`[1:328])
df$forecast <- as.numeric(predtrain)
str(df)
ggplot(data = df, mapping = aes(x = as.Date(term$Tanggal[1:328]))) + 
  geom_line(aes(y = aktual, color = "Aktual"),size=0.5) + 
  geom_line(aes(y = forecast, color = "ARIMA"), size=0.5) +
  theme_bw() + 
  scale_color_manual(name = "",
                     values = c("Aktual" = "blue3", 
                                "ARIMA" = "red3")) + 
  labs(x = "Periode",
       y = "Suhu (Celsius)") + 
  scale_x_date(date_breaks = "2 months", date_labels = "%b\n%Y")

#--------------------------9. peramalan untuk data testing dengan ARIMA(1,0,2)
npred <- forecast(fitm2, h=36, level = c(99.5))
accuracy(npred,test.term) #MAPE=2.80%

#-------------------------10. peramalan suhu 7 hari ke depan dengan ARIMA(1,0,2)
term_arima <- Arima(term$`T Avg`, order = c(1,0,2))
forecast_term <- forecast(term_arima, 7)
plot(forecast_term, col="purple")



