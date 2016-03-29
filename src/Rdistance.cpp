#include "distance.h"

// [[Rcpp::export]]
Rcpp::List Rdistance (std::string w2vFilename, 
               std::string targetWord, 
               int nword) {
  int res;
  std::vector<std::string> tempReturnWordList;
  std::vector<double> tempReturnWordCount;
  
  res = distance(w2vFilename,
                 targetWord,
                 nword,
                 tempReturnWordList,
                 tempReturnWordCount);
  return Rcpp::List::create(Rcpp::Named("word") = tempReturnWordList,
                            Rcpp::Named("dist") = tempReturnWordCount);
}



