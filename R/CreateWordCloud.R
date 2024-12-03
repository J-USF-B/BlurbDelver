#' Create Word Cloud
#'
#' Generates a word cloud from raw or tokenized text.
#'
#' @importFrom dplyr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom wordcloud2 wordcloud2
#'
#' @param text A character vector or an object of class `TokenizedText`.
#' @return A word cloud plot showing word frequencies.
#' @examples
#' CreateWordCloud("This is an example tweet! Tweet tweet!")
#' @export
CreateWordCloud <- function(text) {
  # Tokenize the text
  results <- TokenizeText(text)

  # Rename columns for wordcloud2 compatibility
  word_freq <- results %>%
    rename(word = word, count = n)

  # Create the word cloud
  wordcloud2(word_freq, size = 0.5, color = "random-light")
}
