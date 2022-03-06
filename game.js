/* add selling oil 
       add automatic upgrade price
       add more upgrades*/
const clickBlock = document.getElementById('clickajka');
const oilCounter = document.getElementById('oilCounter');
const currentOilPriceCounter = document.getElementById('currentOilPrice');
clickBlock.addEventListener('click', click)
var oil = 0;
var currentPrice = 10
var money = 10;
var wydobycieMultiplier = 1;
var currentOilPrice = 13.50;
updateMoney(0);
updateOilPrice();
var increaseManualWydobycieAmount = 0;

function updateMoney(amount) {
    money += amount;

    moneyCounter.innerHTML = money.toFixed(2) + 'zł';
}
function updateOilPrice() {
    let odds = Math.floor(Math.random() * 100);
    console.log(odds);
    if (odds > 55) {
        currentOilPrice *= 1 + Math.floor(Math.random() * 50) / 1000;
        currentOilPriceCounter.innerHTML = currentOilPrice.toFixed(2) + 'zł';
        document.getElementById('lastPriceUpdate').innerHTML='';
    }
    else if (odds <= 55) {
        currentOilPrice *= 1 - Math.floor(Math.random() * 40) / 1000;
        if (currentOilPrice < 1) {
            currentOilPrice = 1;
        }
        currentOilPriceCounter.innerHTML = currentOilPrice.toFixed(2) + 'zł';
        document.getElementById('lastPriceUpdate').innerHTML='';
    }
}
setInterval(updateOilPrice, 300000)
function click() {
    oil += 0.01 * wydobycieMultiplier;
    oilCounter.innerHTML = oil.toFixed(3) + 'L ropy';
}

function buyIncreaseWydobycie() {
    if (money >= currentPrice) {
        wydobycieMultiplier += 0.2;
        updateMoney(-currentPrice);

        increaseManualWydobycieAmount++;
        console.log(increaseManualWydobycieAmount)
        currentPrice = 20 + 6 * increaseManualWydobycieAmount * increaseManualWydobycieAmount;
        document.getElementById('increaseWydobycie').innerHTML = 'Kup ' + currentPrice.toFixed(0) + 'zł'
    }
}
function sell(percentage) {
    updateMoney(currentOilPrice * (oil * percentage));
    updateOil(- oil * percentage);


}
function updateOil(amount) {
    oil += amount;
    oilCounter.innerHTML = oil.toFixed(3) + 'L ropy';

}