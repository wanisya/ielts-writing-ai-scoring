<?php
include 'config/db.php';

$answer_id = $_GET['answer_id'] ?? 0;

/* =========================
   AMBIL TASK 1 & TASK 2
========================= */
$q = mysqli_query($conn, "
SELECT * FROM writing_answers 
WHERE id = $answer_id OR id = ".($answer_id+1)."
");

$answers = [];

while($row = mysqli_fetch_assoc($q)){
    $answers[$row['task_type']] = $row['answer'];
}

/* =========================
   VALIDASI DATA
========================= */
$task1 = $answers['task1'] ?? "";
$task2 = $answers['task2'] ?? "";

/* =========================
   CALL PYTHON (TASK 1)
========================= */
$essay1 = escapeshellarg($task1);

/* GANTI PATH PYTHON SESUAI PC KAMU */
$python_path = "python"; 
// contoh:
// $python_path = "C:\\Python311\\python.exe";

$output1 = shell_exec("$python_path ai_scoring.py $essay1");

$result1 = json_decode($output1, true);

if(!$result1){
    $result1 = [
        "band" => 0,
        "feedback" => "AI scoring failed (Task 1)"
    ];
}

/* =========================
   CALL PYTHON (TASK 2)
========================= */
$essay2 = escapeshellarg($task2);

$output2 = shell_exec("$python_path ai_scoring.py $essay2");

$result2 = json_decode($output2, true);

if(!$result2){
    $result2 = [
        "band" => 0,
        "feedback" => "AI scoring failed (Task 2)"
    ];
}

/* =========================
   OVERALL SCORE
========================= */
$overall = round(($result1['band'] + $result2['band']) / 2, 1);

/* =========================
   SIMPAN KE DATABASE
========================= */
mysqli_query($conn, "
INSERT INTO writing_evaluations (answer_id, band, feedback)
VALUES (
    $answer_id,
    ".$result1['band'].",
    '".mysqli_real_escape_string($conn,$result1['feedback'])."'
)
");

mysqli_query($conn, "
INSERT INTO writing_evaluations (answer_id, band, feedback)
VALUES (
    ".($answer_id+1).",
    ".$result2['band'].",
    '".mysqli_real_escape_string($conn,$result2['feedback'])."'
)
");
?>

<!DOCTYPE html>
<html>
<head>
    <title>Writing Result</title>

    <style>
        body {
            font-family: Arial;
            margin: 40px;
            background: #f5f5f5;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        .loading {
            text-align: center;
            font-size: 20px;
            color: #666;
        }

        .score {
            font-size: 40px;
            color: green;
            text-align: center;
            margin-bottom: 20px;
        }

        .task-box {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }

        .feedback {
            margin-top: 10px;
            color: #444;
        }
    </style>

    <script>
        function showResult() {
            document.getElementById("loading").style.display = "none";
            document.getElementById("result").style.display = "block";
        }

        setTimeout(showResult, 1500);
    </script>

</head>

<body>

<div class="container">

    <!-- LOADING -->
    <div id="loading" class="loading">
        🤖 Generating AI Result...
    </div>

    <!-- RESULT -->
    <div id="result" style="display:none;">

        <h2>Writing Result</h2>

        <div class="score">
            Overall Band: <?php echo $overall; ?>
        </div>

        <!-- TASK 1 -->
        <div class="task-box">
            <h3>Task 1</h3>
            <strong>Band:</strong> <?php echo $result1['band']; ?>
            <div class="feedback">
                <strong>Feedback:</strong>
                <?php echo $result1['feedback']; ?>
            </div>
        </div>

        <!-- TASK 2 -->
        <div class="task-box">
            <h3>Task 2</h3>
            <strong>Band:</strong> <?php echo $result2['band']; ?>
            <div class="feedback">
                <strong>Feedback:</strong>
                <?php echo $result2['feedback']; ?>
            </div>
        </div>

    </div>

</div>

</body>
</html>