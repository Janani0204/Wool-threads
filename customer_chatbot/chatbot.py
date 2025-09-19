from chatterbot import ChatBot
from chatterbot.trainers import ChatterBotCorpusTrainer, ListTrainer
from flask import Flask, request, jsonify

chatbot = ChatBot('CustomBot')

corpus_trainer = ChatterBotCorpusTrainer(chatbot)
corpus_trainer.train("chatterbot.corpus.english")

list_trainer = ListTrainer(chatbot)
list_trainer.train([
    "Hello",
    "Hi there!",
    "How are you?",
    "I'm doing well, thank you!",
    "What can you do?",
    "I can help you with various tasks."
])

def is_wool_related(query):
    wool_keywords = ['wool', 'yarn', 'fiber', 'thread', 'textile', 'sheep', 'spinning']
    return any(keyword in query.lower() for keyword in wool_keywords)

def get_response(user_input):
    if not is_wool_related(user_input):
        return "I'm designed to answer only wool-related questions."
    return str(chatbot.get_response(user_input))

app = Flask(__name__)

@app.route("/get_response", methods=["POST"])
def respond():
    user_input = request.json['message']
    response = get_response(user_input)
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
