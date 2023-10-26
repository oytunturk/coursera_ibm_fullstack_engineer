#This import will work before putting eveything in a package under SenstimentAnalysis
#from sentiment_analysis import sentiment_analyzer_basic, sentiment_analyzer
#This import works after packaging your functions
from SentimentAnalysis.sentiment_analysis import sentiment_analyzer_basic, sentiment_analyzer

import json

text = "I love this new technology"

#Basic function that doesn't parse anything
print("--> Calling sentiment_analyzer_basic():")
response = sentiment_analyzer_basic(text)
formatted_response = json.loads(response)
print(formatted_response)

label = formatted_response['documentSentiment']['label']
score = formatted_response['documentSentiment']['score']

print('label = ' + str(label))
print('score = ' + str(score))

#Function that parses and returns label and score
print("--> Calling sentiment_analyzer():")
result = sentiment_analyzer(text)
print(str(result))
