<?php include_once('header.php');
giveHead('Quiz');

/**
 * Wyświetla próby quizu aktualnie zalogowanego użytkownika
 * 
 * @author Frytak aka Furras
 */
function getUserAttempts() {
    global $mysqli;

    $getUserIdSql = "SELECT `id` FROM `users` WHERE `token` = ?";
    $getUserAttempts = "SELECT `users`.`username`, `date`, `points` FROM `users`, `quizattempts` WHERE `users`.`id` = `quizattempts`.`userId` AND `users`.`id` = ? ORDER BY `quizattempts`.`points` DESC, `quizattempts`.`date` ASC LIMIT 10";

    $token = $_SESSION["token"];

    $stmt = $mysqli->prepare($getUserIdSql);
    $stmt->bind_param("s", $token);
    if ($stmt->execute()) {
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        $id = $row["id"];
    }

    $stmt = $mysqli->prepare($getUserAttempts);
    $stmt->bind_param("s", $id);
    if ($stmt->execute()) {
        $result = $stmt->get_result();

        echo '<table>
        <tr class="stickyInfo">
            <th>Nazwa użytkownika</th>
            <th>Data</th>
            <th>Punkty</th>
        </tr>';

        while ($row = $result->fetch_assoc()) {
            echo '<tr>
                    <td>' . $row["username"] . '</td>
                    <td>' . $row["date"] . '</td>
                    <td>' . $row["points"] . '</td>
                </tr>';
        }
    }

}

/**
 * Wyświetla próby quizu wszystkich użytkowników
 * 
 * @author Frytak aka Furras
 */
function getLeaderboard() {
    global $mysqli;

    $sql = "SELECT `users`.`username`, `date`, `points` FROM `users`, `quizattempts` WHERE `users`.`id` = `quizattempts`.`userId` ORDER BY `quizattempts`.`points` DESC, `quizattempts`.`date` ASC LIMIT 10";

    $result = $mysqli->query($sql);

    echo '<table>
            <tr class="stickyInfo">
                <th>Nazwa użytkownika</th>
                <th>Data</th>
                <th>Punkty</th>
            </tr>';

    while ($row = $result->fetch_assoc()) {
        echo '<tr>
                <td>' . $row["username"] . '</td>
                <td>' . $row["date"] . '</td>
                <td>' . $row["points"] . '</td>
            </tr>';
    }

    echo '</table>';
}
?>

<div class="quizStart">
    <div class="header centerContent">
        <h1>Witaj w quizie o Ignacym Łukasiewiczu!</h1>
        <p>Quiz będzie składać się z dziesięciu losowo dobranych pytań.</p>
        <button class="start" onclick="location.href='quiz.php'"><?php if (!empty($_SESSION["token"])) {echo "Jesteś gotowy?";} else {echo "Zaloguj się!";} ?></button>
    </div>

    <div class="information">
        <div class="leaderboard">
            <?php
            getLeaderboard();
            ?>
        </div>

        <div class="userAttempts">
            <?php
            if (!empty($_SESSION["token"])) {
                getUserAttempts();
            }
            ?>
        </div>
    </div>
</div>

<?php 
include_once('footer.html')
?>