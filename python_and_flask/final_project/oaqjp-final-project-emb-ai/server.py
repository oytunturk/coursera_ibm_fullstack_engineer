''' Executing this function initiates the application of emotion
    detection to be executed over the Flask channel and deployed on
    localhost:5000.
'''

from flask import Flask, render_template, request
from EmotionDetection.emotion_detection import emotion_detector

app = Flask("Emotion Detector")

@app.route("/emotionDetector")
def emo_detector():
    ''' This code receives the text from the HTML interface and
        runs emotion detection over it using emotion_detector()
        function. The output returned shows the label and its confidence
        score for the provided text.
    '''

    text_to_analyze = request.args.get('textToAnalyze')
    result, status_code = emotion_detector(text_to_analyze)

    emotions = ['anger', 'disgust', 'fear', 'joy', 'sadness']
    dominant_emotion = None

    print("emotions: " + str(emotions))
    print("server.py --> status_code: " + str(status_code))
    print("result: " + str(result))

    msg = 'Invalid text! Please try again!'
    if result is not None:
        keys = result.keys()
        if 'dominant_emotion' in keys:
            dominant_emotion = result['dominant_emotion']
            if dominant_emotion is not None:
                scores = ''
                for emotion in emotions:
                    if emotion in keys:
                        scores += " '" + emotion + "': " + str(result[emotion])
                msg = f'For the given statement, the system response is {scores}. \
                        The dominant emotion is {dominant_emotion}.'

    return msg, status_code

@app.route("/")
def render_index_page():
    ''' This function initiates the rendering of the main application
        page over the Flask channel                                                                                                                                                
    '''
    return render_template('index.html')

if __name__ == "__main__":
    # Run the app
    app.run(host="0.0.0.0", port=5000)
