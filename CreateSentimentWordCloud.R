#' Create a Word Cloud for Sentiment Analysis
#'
#' Generates a word cloud with color-coding based on sentiment (positive = green, negative = red).
#'
#' @importFrom dplyr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom wordcloud2 wordcloud2
#'
#' @param sentiment_data ONLY PASS THIS PARAM!!! A tibble of sentiment analysis results (either from `SentimentAnalysis` or `SentimentTokenized`).
#' @param tokenized A `TokenizedText` object used to create the word cloud.
#' @return A word cloud visualization.
#' @export
CreateSentimentWordCloud <- function(sentiment_data, tokenized) {

  # Check that 'sentiment_data' has the necessary columns for plotting
  if (!"word" %in% colnames(sentiment_data) | !"freq" %in% colnames(sentiment_data)) {
    stop("Error: sentiment_data must have 'word' and 'freq' columns.")
  }

  # Ensure 'freq' is numeric and remove any rows with missing values
  sentiment_data$freq <- as.numeric(as.character(sentiment_data$freq))
  sentiment_data <- sentiment_data %>% filter(!is.na(freq))

  # Add color based on sentiment
  sentiment_data$color <- ifelse(sentiment_data$sentiment == "positive", "green", "red")

  # Create a new data frame with just the necessary columns
  wordcloud_data <- sentiment_data %>% select(word, freq, color)

  # Create the word cloud with both color and frequency
  wordcloud2(wordcloud_data, size = 0.5, color = wordcloud_data$color)
}
