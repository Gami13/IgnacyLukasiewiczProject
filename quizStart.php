<?php include_once('header.php');
giveHead('Quiz');
?>

<div class="quizStart centerContent">
    <div class="header centerContent">
        <h1>Witaj w quizie o Ignacym Srakasiewiczu!</h1>
        <p>Quiz będzie składać się z dziesięciu losowo dobranych pytań.</p>
        <button class="start" onclick="location.href='quiz.php'">Jesteś gotowy?</button>
    </div>

    <div class="information">
        <div class="leaderboard">

        </div>

        <div class="userAttempts">

        </div>
    </div>
</div>

<?php 
include_once('footer.html')
?>