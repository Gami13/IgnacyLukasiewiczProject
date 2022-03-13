<?php include_once('header.php');
giveHead('Główna');
?><h1 class="chuj2" style="position: relative; width: 100%; text-align:center; margin-top:1rem">Ignacy Łukasiewicz</h1>
<div class="chuj">

    <section class="mainFragment" >
        <div class="obrazek mainItem" onclick="window.location.pathname += '/life.php'">
            <img src="img/img1.jpg" alt="">
            <span>Życiorys</span>
        </div>
        <div class="obrazek mainItem" onclick="window.location.pathname += '/quizStart.php'">
            <img src="img/img1.jpg" alt="">
            <span>Quiz</span>
        </div>
    </section>
    <section class="mainFragment">
        <img class="mainImage" src="img/img1.jpg">
    </section>
    <section class="mainFragment">
        <div class="obrazek mainItem" onclick="window.location.pathname += '/gallery.php'">
            <img src="img/img1.jpg" alt="">
            <span>Galeria</span>
        </div>
        <div class="obrazek mainItem" onclick="window.location.pathname += '/map.php'">
            <img src="img/img1.jpg" alt="">
            <span>Mapa</span>
        </div>
    </section>
</div>

<?php
include_once('footer.html')
?>