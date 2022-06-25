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
