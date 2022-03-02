<?php include_once('header.php');
giveHead('Quiz');
?>
<?php
if (!empty($_SESSION["token"])) {
    echo'<script>const token = '.$_SESSION["token"].'</script>';
}
?>
<script>
const xmlhttp = new XMLHttpRequest();

xmlhttp.onload = function() {console.log(xmlhttp.responseText);}
xmlhttp.open("POST", "addQuizRecord.php");
xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
xmlhttp.send("points=25000&token=" + token);

</script>

<div class="quizStart centerContent">
    <div class="header centerContent">
        <h1>Witaj w quizie o Ignacym Srakasiewiczu!</h1>
        <p>Quiz będzie składać się z dziesięciu losowo dobranych pytań.</p>
        <button class="start" onclick="location.href='quiz.php'"><?php if (!empty($_SESSION["token"])) {echo "Jesteś gotowy?";} else {echo "Zaloguj się!";} ?></button>
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