# Time Series Data Exploration dan Analysis 
BMKG menyatakan bahwa suhu rata-rata maupun anomali suhu tahunan Indonesia cenderung meningkat. Laju peningkatan suhu udara tertinggi tercatat di Stasiun Meteorologi Temindung, Kalimantan Timur, 0.95°C per dekade. Dalam repository ini, dilakukan analisis dan eksplorasi pada data suhu udara rata-rata dari Stasiun Temindung periode 31 Mei 2021 – 29 Mei 2022. Data diambil dari web Pusat Database BMKG. Eksplorasi data time series dilakukan menggunakan Python

# Time Series Data Exploration
Eksplorasi data time series dilakukan menggunakan Python, dengan package yang digunakan yaitu sebagai berikut:
<ol>
  <li>pandas</li>
  <li>pandas_datareader</li>
  <li>numpy</li>
  <li>seaborn</li>
  <li>to_datetime from pandas.core.tools.datetimes</li>
  <li>matplotlib</li>
  <li>plot_acf, plot_pacf from statsmodels.graphics.tsaplots</li>
  <li>adfuller from statsmodels.tsa.stattools</li>
  <li>levene from scipy.stats</li>
  <li>statsmodels.api</li>
</ol>

Eksplorasi yang dilakukan berupa:
<ol>
  <li>Plot Data Harian</li>
  <li>Plot ACF dan PACF</li>
  <li>Uji Augmented Dickey Fuller (ADF)</li>
  <li>Uji Levene</li>
  <li>Plot Hubungan Suhu dan Kelembapan Stasiun Temindung</li>
  <li>Cross Correlation</li>
 </ol>

# Time Series Data Analysis
Data yang digunakan merupakan data suhu rata-rata harian di Stasiun Meteorologi Temindung, Kalimantan Timur (periode 31 Mei 2021–28 Mei 2022). Data dibagi menjadi data training dan data testing dengan pembagian sebagai berikut:

Data Training : 31 Mei 2021–23 April 2022 <br>
Data Testing  : 24 April 2022–29 Mei 2022

Tujuan dari analisis ini adalah untuk mendapatkan model peramalan suhu harian terbaik. Analisis dilakukan menggunakan bahasa pemrograman R dengan package yang dibutuhkan yaitu sebagai berikut:
<ol>
  <li>tseries</li>
  <li>forecast</li>
  <li>lmtest</li>
  <li>car</li>
  <li>readxl</li>
  <li>ggplot2</li>
</ol>

Peramalan suhu harian dilakukan dengan metode ARIMA (Autoregressive Moving Average) dengan prosedur analisis sebagai berikut:
<ol>
  <li>Input data</li>
  <li>Pembagian data training dan testing</li>
  <li>Eksplorasi data : Uji kestasioneran</li>
  <li>Identifikasi model ARIMA</li>
  <li>Pendugaan parameter</li>
  <li>Uji diagnostik model awal</li>
  <li>Overfitting model</li>
  <li>Peramalan</li>
</ol>
