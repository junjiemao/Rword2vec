#' @author  HatMatrix42
#' @name word2vex
#' @title word2vex R API
#' @description word2vec
#' @param train_file
#' @param output_file
#' @param save_vocab_file
#' @param layer1_size Set size of word vectors; default is 100
#' @param binary Save the resulting vectors in binary moded,default is FALSE
#' @param cbow Use the continuous bag of words model,default is TRUE,
#'        Using skip-gram model is FALSE
#' @param alpha Set the starting learning rate; default is 0.025 for 
#'        skip-gram and 0.05 for CBOW
#' @param window Set max skip length between words,default is 5
#' @param hs Use Hierarchical Softmax,default is 0(not used)
#' @param sample Set threshold for occurrence of words. 
#'        Those that appear with higher frequency in the training data.
#' @param negative Number of negative examples; default is 5, 
#'        common values are 3 - 10 (0 = not used)
#' @param iter Run more training iterations (default 5)
#' @param num_threads Use num_threads threads (default 4)
#' @param min_count This will discard words that appear less than min_count times;
#' @param classes Output word classes rather than word vectors; 
#'        default number of classes is 0 (vectors are written)
word2vec <- function(train_file = '',
                     output_file = '',
                     save_vocab_file = '',
                     read_vocab_file = '',
                     layer1_size = 100,
                     binary = FALSE,
                     cbow = TRUE,
                     alpha = ifelse(!cbow,0.025,0.05),
                     window = 5,
                     hs = 0,
                     sample = 10^-3,
                     negative = 5,
                     num_threads = 4,
                     iter = 5,
                     min_count = 5,
                     classes = 0){
  if(!file.exists(train_file))
    stop('train file not exists')
  if(!file.exists(read_vocab_file) && read_vocab_file != '')
    stop('vocab file not exists')
  train_file <- normalizePath(train_file)
  if(output_file == ''){
    output_file <- file.path(dirname(train_file),
                             gsub(pattern = '\\.[A-Za-z]*$',
                                  replacement = ifelse(binary,'.bin','.txt'),
                                  x = basename(train_file)))
    if(normalizePath(output_file,mustWork = FALSE) == train_file)
      output_file <- paste0(output_file,ifelse(binary,'.bin','.txt'))
    
  }
  
  OUT <- Rword2vec(Rtrain_file = train_file,
                   Routput_file = output_file,
                   Rsave_vocab_file = save_vocab_file,
                   Rread_vocab_file = read_vocab_file,
                   Rlayer1_size = layer1_size,
                   Rbinary = as.integer(binary),
                   Rcbow = as.integer(cbow),
                   Ralpha = alpha,
                   Rwindow = window,
                   Rhs = hs,
                   Rsample =sample,
                   Rnegative = negative,
                   Rnum_threads = num_threads,
                   Riter = iter,
                   Rmin_count = min_count,
                   Rclasses = classes)
  if(OUT)
    stop('Task Fail!')
}


