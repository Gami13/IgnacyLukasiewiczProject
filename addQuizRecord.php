<?php
include_once("header.php");
global $mysqli;

$points = $_POST["points"];
$token = $_SESSION["token"];

$getUserIdSql = "SELECT `id` FROM `users` WHERE `token` = ?";
$quizAttemptSql = "INSERT INTO `quizattempts` (`id`, `userId`, `date`, `points`) VALUES (NULL, ?, current_timestamp(), ?)";

$stmt = $mysqli->prepare($getUserIdSql);
$stmt->bind_param("s", $token);
if ($stmt->execute()) {
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    $id = $row["id"];
}

$stmt = $mysqli->prepare($quizAttemptSql);
$stmt->bind_param("ss", $id, $points);
$stmt->execute();
?>