# Share Price animation
Share Price Volume Animation in R

A function using R  <a href="https://cran.r-project.org/web/packages/gganimate/index.html">gganimate</a> and <a href="https://cran.r-project.org/web/packages/quantmod/index.html"> quantmod </a> library to download share price and volume data to plot Price / Volume Chart Animation using 60 days recent closing price. Further using using <a href="https://cran.r-project.org/web/packages/magick/index.html"> magick </a> library to stack Price Volume Chart Animation together and export gif if required. When running this function in R studio, the result should be shown in the Viewer panel like this. <br>
 ![](price_vol_60.gif)
 <br>
Please use https://finance.yahoo.com/lookup for stock code.

 # Run Function
 ani_Price_60(stock_code = "^DJI", download = TRUE)

 

