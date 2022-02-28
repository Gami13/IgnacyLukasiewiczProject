<?php include_once('header.php');
giveHead('Quiz');
?>

<div class="quiz centerContent">
    <div class="question centerContent" id="question">
        <h1>Pytanie 1</h1>
        <p>Gami jest furrasem?</p>
    </div>

    <div class="answers">
        <button class="ans1" id="1">
            <p>Tak</p>
        </button>
        <button class="ans2" id="2">
            <p>Tak</p>
        </button>
        <button class="ans3" id="3">
            <p>Tak</p>
        </button>
        <button class="ans4" id="4">
            <p>Tak</p>
        </button>
    </div>

    <div class="summary">
        <div class="header">
            <h1 id="pointTitle">Zdobyłeś 20000 punktów!</h1>
            <div class="redBar">
                <p id="percentage">80%</p>
                <div class="greenBar"></div>
            </div>
        </div>

        <div class="questions">
            
        </div>
    </div>
</div>

<script src="api.js"></script>

<?php
include_once('footer.html')
?>