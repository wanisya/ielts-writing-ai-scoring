import sys
import json
import re

# =========================
# INPUT ESSAY
# =========================
essay = sys.argv[1] if len(sys.argv) > 1 else ""

# =========================
# PREPROCESSING
# =========================
words = re.findall(r'\b\w+\b', essay.lower())
sentences = re.split(r'[.!?]+', essay)

word_count = len(words)
sentence_count = len([s for s in sentences if s.strip() != ""])

# =========================
# FEATURE EXTRACTION
# =========================

# Vocabulary diversity
unique_words = len(set(words))
vocab_div = unique_words / word_count if word_count > 0 else 0

# Average sentence length
avg_sentence_length = word_count / sentence_count if sentence_count > 0 else 0

# =========================
# SCORING SYSTEM
# =========================

band = 5.0

# Word count scoring
if word_count > 250:
    band += 1.0
elif word_count > 150:
    band += 0.5

# Vocabulary scoring
if vocab_div > 0.5:
    band += 1.0
elif vocab_div > 0.4:
    band += 0.5

# Sentence complexity
if avg_sentence_length > 12:
    band += 0.5

# Clamp band
band = min(band, 7.5)

# =========================
# FEEDBACK SYSTEM
# =========================

feedback = []

if word_count < 150:
    feedback.append("Your essay is too short. Try to expand your ideas.")
else:
    feedback.append("Your essay length is adequate.")

if vocab_div < 0.4:
    feedback.append("Vocabulary is limited. Try using more varied words.")
else:
    feedback.append("Vocabulary usage is fairly good.")

if avg_sentence_length < 10:
    feedback.append("Sentences are too simple. Try more complex structures.")
else:
    feedback.append("Sentence structure shows some complexity.")

# =========================
# OUTPUT
# =========================

result = {
    "band": round(band, 1),
    "feedback": " ".join(feedback)
}

print(json.dumps(result))