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

band = 4.0  # start rendah biar realistis

# Word count scoring
if word_count > 250:
    band += 1.5
elif word_count > 180:
    band += 1.0
elif word_count > 120:
    band += 0.5

# Vocabulary scoring
if vocab_div > 0.55:
    band += 1.5
elif vocab_div > 0.45:
    band += 1.0
elif vocab_div > 0.35:
    band += 0.5

# Sentence complexity
if avg_sentence_length > 14:
    band += 1.0
elif avg_sentence_length > 10:
    band += 0.5

# Clamp band (IELTS max 9)
band = min(band, 8.5)

# =========================
# FEEDBACK SYSTEM (IELTS-LIKE)
# =========================

if band <= 4:
    feedback = (
        "Your writing shows very limited ability in expressing ideas clearly. "
        "There are frequent grammatical errors, and many sentences are incomplete or difficult to understand. "
        "Vocabulary is very basic and repetitive, and there is little variety in sentence structure. "
        "You should focus on building simple and correct sentences, and improving your basic grammar and vocabulary."
    )

elif band <= 5:
    feedback = (
        "Your essay addresses the topic but lacks clarity and sufficient development. "
        "There are noticeable grammatical mistakes, and vocabulary is limited and repetitive. "
        "Sentence structures are mostly simple, and ideas are not fully developed or clearly organized. "
        "You should focus on improving grammar accuracy and expanding your ideas with more detail."
    )

elif band <= 6:
    feedback = (
        "Your writing is generally understandable and relevant to the topic, but there are some grammatical errors "
        "and limitations in vocabulary. Ideas are presented but not always fully developed or clearly connected. "
        "You are able to use some complex sentences, although mistakes are still noticeable. "
        "Focus on improving coherence and using a wider range of vocabulary."
    )

elif band <= 6.5:
    feedback = (
        "Your essay presents clear ideas and is generally well-organized. "
        "There is a good attempt to use a range of vocabulary and sentence structures. "
        "However, some grammatical errors and minor inconsistencies are still present. "
        "Development of ideas could be more detailed and precise. "
        "Overall, this is a solid performance, but further refinement is needed to reach a higher band."
    )

elif band <= 7:
    feedback = (
        "Your writing demonstrates a good command of the English language. "
        "Ideas are clearly presented and logically organized, with effective use of cohesive devices. "
        "You use a variety of sentence structures and appropriate vocabulary, although minor errors still occur. "
        "To improve further, focus on precision and reducing occasional grammatical mistakes."
    )

elif band <= 8:
    feedback = (
        "Your essay is well-developed, clear, and logically structured. "
        "You demonstrate a wide range of vocabulary and sentence structures with a high level of accuracy. "
        "Errors are rare and do not affect communication. "
        "This is a strong performance, and only minor improvements are needed to reach a higher band."
    )

else:
    feedback = (
        "Your writing demonstrates a high level of proficiency with excellent control of grammar and vocabulary. "
        "Ideas are fully developed, well-organized, and clearly expressed. "
        "There is a wide range of sentence structures used accurately and naturally. "
        "This is an excellent response that meets the highest standards of IELTS writing."
    )

# =========================
# DYNAMIC FEEDBACK (BIAR LEBIH NATURAL)
# =========================

if word_count < 150:
    feedback += " Your response is underdeveloped and should be longer."

if vocab_div < 0.4:
    feedback += " Try to use more varied vocabulary."

if avg_sentence_length < 10:
    feedback += " Use more complex sentence structures to improve your score."

# =========================
# OUTPUT
# =========================

result = {
    "band": round(band, 1),
    "feedback": feedback
}

print(json.dumps(result))