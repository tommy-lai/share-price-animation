# Check required Pacakages for installation
list.of.packages <- c("ggplot2", "gganimate", "gifski", "quantmod", "dplyr", "magick")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

# Load Packages
library(ggplot2)
library(gganimate)
library(quantmod)
library(dplyr)
library(magick)

# Price Volume Chart Animation Function
 ani_Price_60 <- function(stock_code = "^DJI", download = T) {
  # Set Stock Code Input
  Share_code <- stock_code
  Day_input <- 60 # more than 60, Volume chart animation may stop early to be investigated
  from_date <- Sys.Date() - Day_input
  
  # Prepare Data
  df_stock <-  getSymbols(Share_code, src="yahoo", from = from_date, auto.assign = F) 
  colnames(df_stock) <- c('Open','High','Low','Close','Volume','Adj_Close')
  df_stock <- as.data.frame(df_stock)
  df_stock$Date <- as.Date(row.names(df_stock))
  df_stock$Chg <- Delt(df_stock$Close)*100
  flat_ind <- sd(df_stock$Chg,na.rm=T)*0.25
  df_stock$flag <- ifelse(round(df_stock$Chg,2) > flat_ind,"2_Up", ifelse(round(df_stock$Chg,2) < -flat_ind,"1_Down","3_Flat"))
  colnames(df_stock) <- c('Open','High','Low','Close','Volume','Adj_Close','Date',"PCT_Chg","Flag")
  
  # Share Price Line Chart Animation
  price_chart <- ggplot(df_stock, aes(x = Date, y = Close, group = 1)) + geom_point(aes(color=Flag), size = 4) + 
    geom_line(aes(color=c(df_stock$Flag[-1,],tail(df_stock$Flag,1)))) +labs(title = paste(Share_code,Day_input,"Days Trend Line Chart",
                                    "\nFrom",min(df_stock$Date),"to", max(df_stock$Date)),
         y = "Closing Price", x = "") + theme_bw() +  transition_reveal(Date) 
  price_gif <- animate(price_chart, width = 640, height = 480, fps = 5, renderer = gifski_renderer(loop = F))
  
  # Share Volume Bar Chart Animation
  vol_chart <- ggplot(df_stock, aes(x = Date, y = Volume,fill=Flag)) +
    geom_bar(stat = "identity", alpha = 0.66) +  
    transition_states(df_stock$Date, transition_length = 1, state_length = 1) +  shadow_mark()+
      labs(title='{closest_state}', caption = "Source: YAHOO! Finance")
  vol_gif <- animate(vol_chart, width = 640, height = 240, fps = 5, renderer = gifski_renderer(loop = F))
  
  # Stack Price Volume Chart Animation
  price_mgif <- image_read(price_gif)
  vol_mgif <- image_read(vol_gif)
  
  stock_gif <- image_append(c(price_mgif[1], vol_mgif[1]),stack=T)
  for(i in 2:length(price_mgif)){
    combined <- image_append(c(price_mgif[i], vol_mgif[i]),stack=T)
    stock_gif <- c(stock_gif, combined)
  }
  if (download) {image_write(stock_gif, path="price_vol_60.gif")}
  return(stock_gif)
 }
 
 # Run Function
 ani_Price_60(stock_code = "^DJI", download = TRUE)
 