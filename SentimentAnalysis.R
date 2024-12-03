#' Sentiment Analysis for Raw Text
#'
#' Analyzes the sentiment of raw text, returning the sentiment (positive/negative) and sentiment score.
#' Tokenizes the text internally and uses the `bing` lexicon to classify words.
#'
#' @importFrom dplyr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom wordcloud2 wordcloud2
#'
#' @param text A character vector containing the raw text.
#' @return A tibble with words, sentiment classification, and sentiment score.
#' @examples
#' sentiment <- SentimentAnalysis("This is wonderful and amazing but also terrible.")
#' @export
SentimentAnalysis <- function(text) {

  # Tokenize the raw text
  tokenized <- TokenizeText(text)

  # Perform sentiment analysis on the tokenized text
  sentiment_analysis <- SentimentTokenized(tokenized)

  return(sentiment_analysis)
}
