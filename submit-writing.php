<?php
include 'config/db.php';

$task1 = $_POST['task1'];
$task2 = $_POST['task2'];

/* SIMPAN */
mysqli_query($conn, "
INSERT INTO writing_answers (task_type, answer)
VALUES 
('task1', '".mysqli_real_escape_string($conn,$task1)."'),
('task2', '".mysqli_real_escape_string($conn,$task2)."')
");

/* AMBIL LAST ID */
$answer_id = mysqli_insert_id($conn);

/* REDIRECT KE LOADING */
header("Location: result.php?answer_id=".$answer_id);
exit;