from flask import Flask, request, jsonify

app = Flask(__name__)

# Wool keyword filter
def is_wool_related(query):
    wool_keywords = ['wool', 'yarn', 'fiber', 'thread', 'textile', 'sheep', 'spinning', 'merino', 'alpaca', 'cashmere', 'mohair']
    return any(keyword in query.lower() for keyword in wool_keywords)

# Wool-specific responses
def get_wool_response(query):
    responses = {
        "hello": "Hi there! Ask me anything about wool.",
        "hi": "Hello! I'm your wool assistant.",
        "how are you": "I'm doing well, ready to talk wool!",
        "what can you do": "I can answer wool-related questions like types, quality, and processing.",
        "what is wool": "Wool is a natural fiber obtained from sheep and other animals, used in textiles for warmth and durability.",
        "types of wool": "Common types include Merino, Cashmere, Alpaca, Mohair, and Shetland wool.",
        "what is merino wool": "Merino wool is a fine, soft wool from Merino sheep, known for its breathability, softness, and moisture-wicking properties.",
        "how to check wool quality": "Wool quality is assessed by fiber diameter (measured in microns), crimp (waviness), staple length, and cleanliness.",
        "is alpaca wool better than sheep wool": "Alpaca wool is warmer and softer, but sheep wool is more elastic and widely used in garments.",
        "how is wool processed": "Wool is sheared from animals, cleaned (scoured), carded to align fibers, spun into yarn, and sometimes dyed.",
        "uses of wool": "Wool is used in clothing, blankets, carpets, insulation, and even acoustic panels due to its natural properties.",
        "wool dyeing": "Wool is dyed using acid dyes that bond well with protein fibers, producing vibrant and long-lasting colors.",
        "wool sustainability": "Wool is biodegradable, renewable, and recyclable, making it an eco-friendly textile choice.",
        "what is cashmere": "Cashmere is a luxurious wool from Cashmere goats, known for its softness, warmth, and lightweight feel.",
        "what is mohair": "Mohair comes from the Angora goat and is prized for its sheen, strength, and silky texture.",
        "what is yarn": "Yarn is a continuous strand of twisted fibers used for knitting, weaving, or sewing textiles — wool yarn is especially warm and elastic.",
        "how is wool spun": "Wool is spun by twisting carded fibers into yarn using spinning wheels or industrial machines.",
        "what is crimp in wool": "Crimp refers to the natural waviness of wool fibers — more crimp means better elasticity and insulation.",
        "how to store wool": "Store wool in a cool, dry place with cedar or lavender to repel moths. Avoid plastic bags for long-term storage.",
        "how to wash wool": "Use cold water and a gentle wool detergent. Hand wash or use a wool cycle in the washing machine. Avoid wringing or tumble drying."
    }

    query_lower = query.lower().strip()
    for key in responses:
        if key in query_lower:
            return responses[key]
    # If wool-related but not matched, return a general wool fact
    return "Wool is a versatile, natural fiber used in everything from fashion to insulation. Ask me something more specific!"

# Flask route
@app.route("/get_response", methods=["POST"])
def respond():
    user_input = request.json['message']
    if not is_wool_related(user_input):
        return jsonify({"response": "I'm designed to answer only wool-related questions."})
    response = get_wool_response(user_input)
    return jsonify({"response": response})

if __name__ == "__main__":
    app.run(debug=True)
