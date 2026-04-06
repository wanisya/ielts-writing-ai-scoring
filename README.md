# 🚀 AI-Based IELTS Writing Scoring System

A simplified AI-powered system for evaluating IELTS Writing tasks using text analysis and heuristic NLP techniques.

---

## 📌 Overview

This project simulates an IELTS Writing test environment where users can:

* Complete Writing Task 1 and Task 2
* Submit their answers
* Receive an automated band score and feedback

The system is designed as a **lightweight AI prototype**, focusing on text processing and scoring logic without relying on external APIs.

---

## 🧠 Key Features

* ✍️ Writing test simulation (Task 1 & Task 2)
* 🖼️ Image-based questions (IELTS-style prompts)
* ⏱️ Timer system (real test experience)
* 📊 Automated band scoring (0–9 scale)
* 💬 IELTS-like feedback generation
* 🔍 NLP-based text analysis:

  * Word count
  * Vocabulary diversity
  * Sentence complexity

---

## ⚙️ How It Works

The system follows a complete pipeline:

User Input (Essay)
→ Text Preprocessing
→ Feature Extraction (NLP)
→ Heuristic Scoring
→ Feedback Generation
→ Result Display

---

## 🧩 Tech Stack

* **Frontend**: HTML, CSS
* **Backend**: PHP
* **AI Engine**: Python
* **Database**: MySQL
* **NLP Approach**: Rule-based + Text Analysis

---

## 📊 Scoring Methodology

This project uses a **semi-AI approach**, combining:

* Rule-based scoring
* Linguistic features such as:

  * Lexical diversity
  * Sentence length
  * Essay length

The scoring system simulates IELTS band evaluation and generates realistic feedback based on performance levels.

---

## ⚠️ Note

This is a **simplified version** of a larger AI system.

The full production version includes more advanced NLP models and deeper evaluation techniques.

---

## 🛠️ Installation & Setup

1. Clone this repository:

   git clone https://github.com/yourusername/ielts-writing-ai-scoring.git

2. Move the project to your XAMPP `htdocs` folder

3. Import the database:

   * Open phpMyAdmin
   * Import `database.sql`

4. Configure database connection in:

   config/db.php

5. Run the project:

   http://localhost/writing_ielts_ai/writing-test.php

---

## 📁 Project Structure

writing_ielts_ai/
│
├── assets/
│   └── writing/
│
├── config/
│   └── db.php
│
├── writing-test.php
├── submit-writing.php
├── result.php
├── ai_result.py
├── ai_scoring.py
│
├── ielts_writing_test.sql
└── README.md

---

## 🎯 Purpose

This project was developed as:

* A portfolio project
* A research prototype for AI-based language assessment
* A foundation for a future startup idea in education technology

---

## 💡 Future Improvements

* Deep learning / transformer-based scoring
* Grammar error detection
* Multi-criteria IELTS scoring (TR, CC, LR, GRA)
* Speaking test integration (speech-to-text + scoring)

---

## 👩‍💻 Author

Developed by **Wani Syafitri**
LPDP Awardee | Master's in Computer Science
Focus: Artificial Intelligence, NLP, AI-based Education Systems, and Backend Development (PHP, Javascript, and MySQL)

---

## ⭐ If you find this project useful

Give it a star ⭐ on GitHub!
