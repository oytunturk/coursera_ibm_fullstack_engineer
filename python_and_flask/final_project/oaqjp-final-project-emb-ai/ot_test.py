from emotion_detection import emotion_detector

text = "I love this new technology"

#Function that parses and returns label and score                                                                                                                                    
print("--> Calling emotion_detector():")
result = emotion_detector(text)
print(str(result))
