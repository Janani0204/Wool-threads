from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer

chatbot = ChatBot('MyBot')
trainer = ChatterBotCorpusTrainer(chatbot)
trainer.train("chatterbot.corpus.english")

def get_response(user_input):
    return str(chatbot.get_response(user_input))

from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route("/get_response", methods=["POST"])
def respond():
    user_input = request.json['message']
    response = get_response(user_input)
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
    from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route("/get_response", methods=["POST"])
def respond():
    user_input = request.json['message']
    response = get_response(user_input)
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)

from chatterbot import ChatBot
from chatterbot.trainers import ListTrainer

chatbot = ChatBot('CustomBot')
trainer = ListTrainer(chatbot)

# Train with custom data
trainer.train([
    "Hello",
    "Hi there!",
    "How are you?",
    "I'm doing well, thank you!",
    "What can you do?",
    "I can help you with various tasks."
])    