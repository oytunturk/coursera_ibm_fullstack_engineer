from sentiment_analysis import sentiment_analyzer
import json

response = sentiment_analyzer("I love this new technology")
formatted_response = json.loads(response)
print(formatted_response)

