import requests
import json

def emotion_detector(text_to_analyze):
    url = 'https://sn-watson-emotion.labs.skills.network/v1/watson.runtime.nlp.v1/NlpService/EmotionPredict'
    header = {"grpc-metadata-mm-model-id": "emotion_aggregated-workflow_lang_en_stock"}
    myobj = { "raw_document": { "text": text_to_analyze } }
    response = requests.post(url, json = myobj, headers=header)
    formatted_response = json.loads(response.text)
    status_code = response.status_code
    print(formatted_response)
    print("response.status_code: " + str(status_code))

    emotions = ['anger', 'disgust', 'fear', 'joy', 'sadness']
    max_score = None
    dominant_emotion = None
    result = {}
    if response.status_code == 200:
        all_scores = formatted_response['emotionPredictions'][0]['emotion']
        for emotion in emotions:
            if emotion in all_scores.keys():
                result[emotion] = all_scores[emotion]
                if max_score is None or result[emotion]>max_score:
                    max_score = result[emotion]
                    dominant_emotion = emotion
            else:
                result[emotion] = None
        result['dominant_emotion'] = dominant_emotion
    elif response.status_code == 400 or response.status_code == 304:
        for emotion in emotions:
            result[emotion] = None
        result['dominant_emotion'] = None
    else:
        result = None
    return result, status_code
