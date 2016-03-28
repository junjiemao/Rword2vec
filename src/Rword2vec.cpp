#include <Rcpp.h>
#include <stdlib>
#include "word2vec.h"
using namespace Rcpp;


// [[Rcpp::export]]
int Rword2vec( std::string Rtrain_file,
               std::string Routput_file,
               std::string Rsave_vocab_file,
               std::string Rread_vocab_file,
               int Rlayer1_size,
               int Rbinary,
               int Rcbow,
               int Ralpha,
               int Rwindow,
               int Rhs,
               int Rsample,
               int Rnegative,
               int Rnum_threads,
               int Riter,
               int Rmin_count,
               int Rclasses){
  int i;
  
  strcpy(train_file,Rtrain_file.c_str());
  strcpy(output_file,Routput_file.c_str());
  strcpy(save_vocab_file,Rsave_vocab_file.c_str());
  strcpy(read_vocab_file,Rread_vocab_file.c_str());
  layer1_size = Rlayer1_size;
  binary = Rbinary;
  cbow = Rcbow;
  alpha = Ralpha;
  window = Rwindow;
  hs = Rhs;
  sample = Rsample;
  negative = Rnegative;
  num_threads = Rnum_threads;
  iter = Riter;
  min_count = Rmin_count;
  classes  = Rclasses;
  
  vocab = (struct vocab_word *)calloc(vocab_max_size, sizeof(struct vocab_word));
  vocab_hash = (int *)calloc(vocab_hash_size, sizeof(int));
  expTable = (real *)malloc((EXP_TABLE_SIZE + 1) * sizeof(real));
  for (i = 0; i < EXP_TABLE_SIZE; i++) {
    expTable[i] = exp((i / (real)EXP_TABLE_SIZE * 2 - 1) * MAX_EXP); // Precompute the exp() table
    expTable[i] = expTable[i] / (expTable[i] + 1);                   // Precompute f(x) = x / (x + 1)
  }
  TrainModel();
  
  return 0;
}

