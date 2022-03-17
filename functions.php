<?php

$mysqli = new mysqli("localhost", "root", "", "ignacy");

/**
 * Sprawdza czy użytkownik jest zalogowany
 * 
 * @author Frytak aka Furras
 */
function isLoggedIn() {
    global $mysqli;

    if (!empty($_SESSION["token"])) {
        $sql = "SELECT `token` FROM `users` WHERE `token` = ?";
        $token = $_SESSION["token"];

        $stmt = $mysqli->prepare($sql);
        $stmt->bind_param("s", $token);
        if ($stmt->execute()) {
            $result = $stmt->get_result();
            if ($result->num_rows == 1) {
                return "Jest zalogowany " . $result->num_rows;
            } else {
                return "Nie jesteś zalogowany " . $result->num_rows;
            }
        }
    }
} 