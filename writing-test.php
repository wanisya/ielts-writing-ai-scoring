<?php
session_start();
?>

<!DOCTYPE html>
<html>
<head>
    <title>IELTS Writing Test</title>
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f9f9f9;
        }

        h2 {
            margin-bottom: 10px;
        }

        .timer {
            font-size: 20px;
            color: red;
            margin-bottom: 20px;
        }

        .task {
            background: #fff;
            padding: 20px;
            margin-bottom: 30px;
            border-radius: 8px;
            box-shadow: 0 0 5px rgba(0,0,0,0.1);
        }

        textarea {
            width: 100%;
            height: 180px;
            margin-top: 10px;
            padding: 10px;
            font-size: 14px;
        }

        img {
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .word-count {
            font-size: 13px;
            color: #555;
            margin-top: 5px;
        }

        button {
            padding: 12px 25px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>

<h2>IELTS Writing Test</h2>

<div class="timer">
    Time Left: <span id="time">60:00</span>
</div>

<form method="POST" action="submit-writing.php">

    <!-- TASK 1 -->
    <div class="task">
        <h3>Task 1</h3>
        <p>Describe the chart below:</p>

        <img src="assets/writing/task_1.jpg" width="700">

        <textarea name="task1" id="task1" required></textarea>
        <div class="word-count">
            Word Count: <span id="count1">0</span>
        </div>
    </div>

    <!-- TASK 2 -->
    <div class="task">
        <h3>Task 2</h3>
        <p>Write an essay based on the topic:</p>

        <img src="assets/writing/task_2.jpg" width="800">

        <textarea name="task2" id="task2" required></textarea>
        <div class="word-count">
            Word Count: <span id="count2">0</span>
        </div>
    </div>

    <button type="submit">Finish & Submit</button>

</form>

<!-- TIMER -->
<script>
let time = 3600; // 60 menit

setInterval(() => {
    let m = Math.floor(time / 60);
    let s = time % 60;

    document.getElementById("time").innerText =
        m + ":" + (s < 10 ? "0" + s : s);

    if (time <= 0) {
        alert("Time is up!");
        document.forms[0].submit();
    }

    time--;
}, 1000);
</script>

<!-- WORD COUNTER -->
<script>
function countWords(text) {
    return text.trim().split(/\s+/).filter(word => word.length > 0).length;
}

document.getElementById("task1").addEventListener("input", function() {
    document.getElementById("count1").innerText = countWords(this.value);
});

document.getElementById("task2").addEventListener("input", function() {
    document.getElementById("count2").innerText = countWords(this.value);
});
</script>

</body>
</html>