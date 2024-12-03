#' Tokenize Text
#'
#' @importFrom dplyr %>%
#' @importFrom tidytext unnest_tokens
#' @importFrom wordcloud2 wordcloud2
#'
#' Splits a character vector into individual tokens (words).
#' Removes punctuation and converts text to lowercase for uniformity.
#'
#' @param text A character vector containing the text to tokenize.
#' @return An object of class `TokenizedText` (a data frame with `word` and `count` columns).
#' @examples
#' TokenizeText(c("This is an example tweet!", "Tweet tweet!"))
#' @export
TokenizeText <- function(text) {

  # Ensure input is a character vector
  if (!is.character(text)) {
    stop("Input `text` must be a character vector.")
  }

  # Create a data frame with each line as an entry
  text_df <- tibble(line = seq_along(text), text = text)

  # Tokenize and count words
  tokenized <- text_df %>%
    unnest_tokens(word, text) %>%
    count(word, sort = TRUE)

  # Assign class
  class(tokenized) <- c("TokenizedText", class(tokenized))
  return(tokenized)
}
