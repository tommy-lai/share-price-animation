# Share Price Animation
Share Price Volume Animation in R

A function using R  <a href="https://cran.r-project.org/web/packages/gganimate/index.html">gganimate</a> and <a href="https://cran.r-project.org/web/packages/quantmod/index.html"> quantmod </a> library to download share price and volume data to plot Price / Volume Chart Animation using 60 days recent closing price. Further using <a href="https://cran.r-project.org/web/packages/magick/index.html"> magick </a> library to stack Price Volume Chart Animation together and export gif if required. When running this function in R studio, the result should be shown in the Viewer panel like this. <br>
 ![](price_vol_60.gif)
 <br>
Please use https://finance.yahoo.com/lookup for stock code.

# Run Function
ani_Price_60(stock_code = "^DJI", download = TRUE)

# 
 <b> Relative share price movement animation </b> to show adjusted share price relative movement since <a href="https://financialservices.royalcommission.gov.au/Pages/default.aspx"> Royal Commission into Misconduct in the Banking, Superannuation and Financial Services Industry</a> in Australia for illustartion purpose.<br>
 ![](Relative_shares.gif) <br>
 <a href="https://github.com/tommy-lai/share-price-animation">Refresh</a> page to re-run animation

#
<i><small> Disclaimer: Past performance is not an indicative of future results. Displayed information is for educational or informational purposes only, and is not intended as financial or investment advice and must not be construed or relied on as such. The material in this website was prepared in good faith and I accept no liability for any errors or omissions or misrepresentation in the material or otherwise. 
 </small></i>

