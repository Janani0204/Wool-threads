def is_wool_related(query):
    wool_keywords = ['wool', 'yarn', 'fiber', 'thread', 'textile', 'sheep', 'spinning']
    return any(keyword in query.lower() for keyword in wool_keywords)

def generate_response(query):
    if not is_wool_related(query):
        return "I'm designed to answer only wool-related questions. 🧶"
    # Proceed with actual response generation
