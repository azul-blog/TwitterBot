parse_website <- function(url){ #só lê o blog e busca por posts
  require(xml2)
  pag <- read_html(url)
  fs <- xml_find_all(pag,xpath = "//ul[@id= 'post-list']/li/a")
  ss <- xml_attr(fs,"href")
  return(ss)
} 

parse_website("https://azul.netlify.com/")

checkBlog <- function(newList,oldList){ #Lido o blog, você pode comparar uma lista com os posts "antigos" com os posts novos e se tiver um post novo ele retorna o link pro post novo. A lista não precisa ser um objeto lista, pode ser um vetor com as urls que o parse_website cospe
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