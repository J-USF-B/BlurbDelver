#' Sentiment Analysis for Tokenized Text
#'
#' Analyzes the sentiment of tokenized text, returning the sentiment (positive/negative) and sentiment score.
#' Uses the `bing` lexicon to classify words.
#'
#' @importFrom dplyr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom wordcloud2 wordcloud2
#'
#' @param tokenized A `TokenizedText` object from the `TokenizeText` function.
#' @return A tibble with words, sentiment classification, sentiment score, and frequency of each word.
#' @examples
#' tokenized <- TokenizeText("This is wonderful and amazing but also terrible.")
#' sentiment <- SentimentTokenized(tokenized)
#' @export
SentimentTokenized <- function(tokenized) {

  # Load the bing lexicon (positive and negative words)
  sentiment_lexicon <- get_sentiments("bing")

  # Perform the sentiment analysis by joining the tokenized words with the sentiment lexicon
  sentiment_analysis <- tokenized %>%
    inner_join(sentiment_lexicon, by = c("word" = "word")) %>%
    count(word, sentiment, sort = TRUE) %>%
    ungroup() %>%
    mutate(sentiment_score = case_when(
      sentiment == "positive" ~ 1,
      sentiment == "negative" ~ -1,
      TRUE ~ 0
    )) %>%
    rename(freq = n) %>%
    filter(!is.na(freq))  # Ensure there are no NAs in freq

  # Ensure that the 'freq' column is numeric
  sentiment_analysis$freq <- as.numeric(sentiment_analysis$freq)

  # Double-check the structure of sentiment_analysis to make sure it's correct
  print(head(sentiment_analysis))  # For debugging

  # Return the sentiment analysis results
  return(sentiment_analysis)
}
