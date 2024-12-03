# showcase_functions.R

# Load the package
library(BlurbDelver)

# Example text for processing
text <- "This is wonderful and amazing but also terrible."

tokens <- TokenizeText(text)

CreateWordCloud(text)

sentiment_results <- SentimentAnalysis(text)

CreateSentimentWordCloud(sentiment_results)

sentiment_tokens <- SentimentTokenized(tokens)

CreateSentimentWordCloud(sentiment_tokens)
