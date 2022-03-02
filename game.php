<?php
include_once('header.php');
giveHead('Gra');
?>


<div class='gameWindow'>
    <div id="game" class="game">
        <span id="oilCounter">100 ropy</span>
        <span id="moneyCounter">100 ropy</span>
        <button id="clickajka">

        </button>
        <button onclick="buyIncreaseWydobycie()">Zwiększ wydobycie</button>
        <div class="sellMenu">
            <span class="lastPriceUpdate"> </span>
            <span class="currentOilPrice" id="currentOilPrice"></span>
            <button class="sell">10%</button>
            <button class="sell">25%</button>
            <button class="sell">50%</button>
            <button class="sell">100%</button>

        </div>
    </div>
</div>
<script>
    /* add selling oil 
        add automatic upgrade price
        add more upgrades*/
    const clickBlock = document.getElementById('clickajka');
    const oilCounter = document.getElementById('oilCounter');
    const currentOilPriceCounter = document.getElementById('currentOilPrice');
    clickBlock.addEventListener('click', click)
    var oil = 0;
    var money = 10;
    var wydobycieMultiplier = 1;
    var currentOilPrice = 2.90;
    updateMoney(0);
    updateOilPrice();

    function updateMoney(amount) {
        money += amount;
        
        moneyCounter.innerHTML = money.toFixed(2) + 'zł';
    }
    function updateOilPrice()
    {
        let odds = Math.floor(Math.random()*100);
        console.log(odds);
        if(odds > 55)
        {
            currentOilPrice *= 1+Math.floor(Math.random()*50)/1000;
            currentOilPriceCounter.innerHTML = currentOilPrice.toFixed(2) + 'zł';

        }
        else if(odds <= 55)
        {
            currentOilPrice *= 1-Math.floor(Math.random()*40)/1000;
            if (currentOilPrice < 1)
            {
                currentOilPrice = 1;
            }
            currentOilPriceCounter.innerHTML = currentOilPrice.toFixed(2) + 'zł';
            
        }
    }
    setInterval(updateOilPrice, 500)
    function click() {
        oil += 0.01 * wydobycieMultiplier;
        oilCounter.innerHTML = oil.toFixed(3) + 'L ropy';
    }

    function buyIncreaseWydobycie() {
        if (money >= 10) {
            wydobycieMultiplier *= 1.25;
            updateMoney(-10);
        }
    }
</script>

<?php
include_once('footer.html')
?>