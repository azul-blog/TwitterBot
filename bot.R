##################################
#     Bot de Twitter da Azul     #
##################################


library(dplyr)
library(xml2)
library(telegram.bot)

rm(list=ls())

parse_website <- function(url){
  require(xml2)
  pag <- read_html(url)
  fs <- xml_find_all(pag,xpath = "//h3[@class= 'item-title']/a")
  ss <- xml_attr(fs,"href")
  return(ss)
}

checkBlog <- function(newList,oldList,token){
  require(Rfacebook)
  teste <- prod(newList == oldList)
  if(teste==1){
    return("No updates")
  } else{
    readline(prompt= "New post. Press [enter] to continue")
    new_post_url <- newList[newList != oldList][1]
    new_post_url <- paste0("https://azul.netlify.com/",new_post_url)
    updateStatus("Novo post", token = token, link = new_post_url)
  }
}

save(obj, file = "Face_update/Lista.Rdata")
load(paste0(getwd(),"/Face_update/dados.Rdata"))
load(paste0(getwd(),"/Face_update/Lista.Rdata"))

site <- parse_website("https://azul.netlify.com/")
post <- checkBlog(site,obj)

bot <- Bot(token = bot_token('azulblog_bot'))
updates <- bot$getUpdates()






## chaves específicas do bot da Azul, não vai funcionar em outro bot


consumerKey = 'DI7LdAavAOI0ECX6Q9UJaut36'
consumerSecret = 'JG9b7yXIRzVGqUNdnnYyj7aN8V2rKScg0Ki3FInmYejg5FOU7b'
accessToken = '1095031271540047873-WR3WQ6Uxhz17dltsEcULPijBvfNwjA'
accessTokenSecret = 'itq8Mr9Bu1l4NUtmtFrLF0zmhyuvp0Plvg85OidmvBN7z'

twitteR::setup_twitter_oauth(consumerKey, 
                             consumerSecret,
                             accessToken,
                             accessTokenSecret)

tweet %>% twitteR::tweet()