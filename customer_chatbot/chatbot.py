from flask import Flask, request, jsonify

app = Flask(__name__)

def is_wool_related(query):
    wool_keywords = ['wool', 'yarn', 'fiber', 'thread', 'textile', 'sheep', 'spinning', 'merino', 'alpaca']
    return any(keyword in query.lower() for keyword in wool_keywords)

def get_wool_response(query):
    responses = {
         "Hello",
         "Hi there!",
         "How are you?",
         "I'm doing well, thank you!",
         "What can you do?",
         "I can help you with various tasks."
         "what is merino wool": "Merino wool is a fine, soft wool from Merino sheep, known for its breathability and comfort.",
         "how to check wool quality": "You can assess wool quality by checking fiber diameter, crimp, and staple length.",
         "is alpaca wool better than sheep wool": "Alpaca wool is warmer and softer, but sheep wool is more elastic and widely used.",
   }

    query_lower = query.lower()
    for key in responses:
        if key in query_lower:
            return responses[key]
    return "That's a wool-related question, but I don't have a specific answer yet."

@app.route("/get_response", methods=["POST"])
def respond():
    user_input = request.json['message']
    if not is_wool_related(user_input):
        return jsonify({"response": "I'm designed to answer only wool-related questions."})
    response = get_wool_response(user_input)
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
