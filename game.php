<?php
include_once('header.php');
giveHead('Gra');
?>


<div class='gameWindow'>
    <div id="game" class="game">
        <span id="oilCounter">100 ropy</span>
        <span id="moneyCounter">100 ropy</span>
        <button id="clickajka">
            Clickajka
        </button>
        <div class="buyMenu">
            <div class="sellMenu">
                <span id="lastPriceUpdate">k </span>
                <span class="currentOilPrice" id="currentOilPrice"></span>
                <button class="sell" onclick="sell(0.1)">10%</button>
                <button class="sell" onclick="sell(0.25)">25%</button>
                <button class="sell" onclick="sell(0.5)">50%</button>
                <button class="sell" onclick="sell(1.0)">100%</button>

            </div>
            <button id="increaseWydobycie" onclick="buyIncreaseWydobycie()">Zwiększ wydobycie</button>

        </div>
    </div>
</div>
<script src="game.js">

</script>

<?php
include_once('footer.html')
?>