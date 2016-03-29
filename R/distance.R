#' @author HatMatrix42
#' @name distance
#' @description  
#' @param fileName
#' @param word
#' @param n 

distance <- function(fileName = '',
                     word = '',
                     n = 100){
  if(n>200 || !is.numeric(n)) stop('n too large,must <= 200 OR n is not a integer')
  if(!file.exists(fileName)) stop('file not exsits')
  OUT <- Rdistance(w2vFilename = normalizePath(fileName),
            targetWord = word,
            nword = as.integer(n))
  if(length(OUT) != 0)
    return(data.frame(word = OUT$word, 
                      distance = OUT$dist,
                      stringsAsFactors = FALSE))
}
