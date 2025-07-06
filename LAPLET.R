#install packages(devtools)
#importing libraries
library(rvest)#harvest the data from web page
library(dplyr)#data manipulation
library(robotstxt)#download and pars text files
library(stringr)#to manipulate and transform string
#scrapping website
url<-"https://www.flipkart.com/search?q=laplet&otracker=search&otracker1=search&marketplace=FLIPKART&as-show=on&as=off"
#allowability
path=paths_allowed(url)
#HTML from the website
web=read_html(url)
View(web)
#SEGREGATING NAMES
names<- web %>% html_nodes(".KzDlHZ")%>% html_text()
View(names)
#SEGREGATING PRICE
price<- web  %>% html_nodes("._4b5DiR")%>% html_text()
View(price)
#SEGREGATING RAM
ram<- web  %>% html_nodes(".J\\+igdf:nth-child(2)")%>% html_text()
View(ram)
#SEGREGATING OPERATING SYSTERM
os<- web  %>% html_nodes(".J\\+igdf:nth-child(3)")%>% html_text()
View(os)
#SEGREGATING GB
gp<- web  %>% html_nodes(".J\\+igdf:nth-child(4)")%>% html_text()
View(gp)
#create data frame
laplet=data.frame(names,price,ram,os,gp)
View(laplet)
#write the file
write.csv(laplet,"flipcart_laplet.csv")
#check data type
str(laplet)



