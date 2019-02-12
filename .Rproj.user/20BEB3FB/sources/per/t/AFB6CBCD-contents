parse_website <- function(url){
  require(xml2)
  pag <- read_html(url)
  fs <- xml_find_all(pag,xpath = "//ul[@id= 'post-list']/li/a")
  ss <- xml_attr(fs,"href")
  return(ss)
}

checkBlog <- function(newList,oldList){
  dife <- setdiff(newList,oldList)
  teste <- length(dife)
  if(teste==0){
    print("No updates")
  } else{
    readline(prompt = "New post. Press [enter] to continue")
    new_post_url <- dife[1]
    new_post_url <- new_post_url
    return(new_post_url)
  }
}
