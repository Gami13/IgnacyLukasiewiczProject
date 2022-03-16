<?php include_once('header.php');
giveHead('Główna');
?>

<div class="mainWrapper">
<h1 style="width: 100%; text-align:center; font-size:5rem; margin-bottom: -3rem; margin-top:1rem">Ignacy Łukasiewicz</h1>
    <section class="mainFragment" >
        <div class="obrazek mainItem" onclick="window.location.pathname += '/life.php'">
            <img src="https://www.odleglosci.pl/galeria-081324/Tablica-na-grobie-Honoraty-Lukasiewicz.jpg" alt="">
            <span>Życiorys</span>
        </div>
        <div class="obrazek mainItem" onclick="window.location.pathname += '/quizStart.php'">
            <img src="https://citik.jaslo.pl/wp-content/uploads/2017/06/apteka_lukasiewicza-1.jpg" alt="">
            <span>Quiz</span>
        </div>
    </section>
 
    <section class="mainFragment">
        <div class="obrazek mainItem" onclick="window.location.pathname += '/gallery.php'">
            <img src="img/img1.jpg" alt="">
            <span>Galeria</span>
        </div>
        <div class="obrazek mainItem" onclick="window.location.pathname += '/map.php'">
            <img src="img/map.png" alt="">
            <span>Mapa</span>
        </div>
    </section>
</div>

<?php
include_once('footer.html')
?>