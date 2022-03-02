const question = document.getElementById("question");
const answers = document.querySelectorAll(".answers > *");
var currentQuestion = 1;
var questionNumber = 1;
var totalScore = 0;
const alreadyAnswered = [];
var quizSummary = {};
const questions = {
    1: {
        questionTitle: "Gdzie urodził się Ignacy Łukasiewicz?",
        ans1: "We Wrocławiu",
        ans2: "W Gorlicach",
        ans3: "W Zadusznikach",
        ans4: "W Rzeszowie",
        goodAns: 3
    },
    2: {
        questionTitle: "Którego roku urodził się Łukasiewicz?",
        ans1: "1822 r.",
        ans2: "1843 r.",
        ans3: "1956 r.",
        ans4: "1834 r.",
        goodAns: 1
    },
    3: {
        questionTitle: "Kim z pochodzenia był Ojciec Ignacego Łukasiewicza?",
        ans1: "Mieszczanem",
        ans2: "Chłopem",
        ans3: "Szlachcicem",
        ans4: "Żydem",
        goodAns: 3
    },
    4: {
        questionTitle: "Gdzie Ignacy Łukasiewicz chodził do gimnazjum?",
        ans1: "W Warszawie",
        ans2: "W Rzeszowie",
        ans3: "W Gorlicach",
        ans4: "W Krośnie",
        goodAns: 2
    },
    5: {
        questionTitle: "Kim z zawodu był Ignacy Łukasiewicz?",
        ans1: "Bankierem",
        ans2: "Doktorem",
        ans3: "Rycerzem",
        ans4: "Aptekarzem",
        goodAns: 4
    },
    6: {
        questionTitle: "Jak nazywała się żona Ignacego Łukasiewicza?",
        ans1: "Honorata Stacherska",
        ans2: "Agnieszka Stacherska",
        ans3: "Marianna Stachurska",
        ans4: "Matylda Stacharska",
        goodAns: 1
    },
    7: {
        questionTitle: "Gdzie Ignacy otworzył pierwszą na świecie kopalnie ropy naftowej?",
        ans1: "W Rzeszowie",
        ans2: "W Bóbrce",
        ans3: "W Gorlicach",
        ans4: "W Krakowie",
        goodAns: 2
    },
    8: {
        questionTitle: "Co Łukasiewicz prowadził w Jaśle?",
        ans1: "Zbiórkę pieniędzy na potrzeby naukowe",
        ans2: "Kopalnie ropy naftowej",
        ans3: "Działalność charytatywną",
        ans4: "Działalność aptekarską i destylarnię ropy",
        goodAns: 4
    },
    9: {
        questionTitle: "Gdzie pochowany jest Ignacy Łukasiewicz?",
        ans1: "W Zręcinie",
        ans2: "W Łącku",
        ans3: "W Gorlicach",
        ans4: "W Rzeszowie",
        goodAns: 1
    },
    10: {
        questionTitle: "W jakiej aptece pracował Łukasiewicz w 1848 roku?",
        ans1: "W aptece „Pod Małym Słoneczkiem”",
        ans2: "W aptece „Pod Czarnym Diamentem”",
        ans3: "W aptece „Pod Złotą Gwiazdą”",
        ans4: "W aptece „Pod Złotą Sztabką”",
        goodAns: 3
    },
    11: {
        questionTitle: "W którym roku skonstruowano pierwszą lampę naftową na świecie?",
        ans1: "W 1851 r.",
        ans2: "W 1853 r.",
        ans3: "W 1856 r.",
        ans4: "W 1864 r.",
        goodAns: 2
    },
    12: {
        questionTitle: "Gdzie znajduje się pierwsza uliczna lampa naftowa?",
        ans1: "We Wrocławiu",
        ans2: "W Gorlicach",
        ans3: "W Łącku",
        ans4: "W Rzeszowie",
        goodAns: 2
    },
    13: {
        questionTitle: "W którym roku zmarł Ignacy Łukasiewicz?",
        ans1: "W 1877 r.",
        ans2: "W 1880 r.",
        ans3: "W 1881 r.",
        ans4: "W 1882 r.",
        goodAns: 4
    },
    14: {
        questionTitle: "Dlaczego Ignacy Łukasiewicz został aresztowany?",
        ans1: "Za działalność w tajnej organizacji niepodległościowej",
        ans2: "Za sprzeciwianie się władzy",
        ans3: "Za nielegalną działaność wydobywania ropy naftowej",
        ans4: "Za brak działaności na rzecz Państwa",
        goodAns: 1
    },
    15: {
        questionTitle: "Z jakiego powodu zmarł Łukasiewicz?",
        ans1: "Popełnił samobójstwo",
        ans2: "Z powodu cukrzycy",
        ans3: "Miał zapalenie płuc",
        ans4: "Miał problemy z sercem",
        goodAns: 3
    },
    16: {
        questionTitle: "Jak nazywa się film dokumentalny o Łukasiewiczu który powstał w 2009r?",
        ans1: "Gorlice miasto światła",
        ans2: "Nowa era",
        ans3: "Rozjaśnić mrok",
        ans4: "Ojciec Łukasiewicz",
        goodAns: 3
    },
    17: {
        questionTitle: "Jak nazywały się córki Łukasiewicza?",
        ans1: "Józefina i Marta",
        ans2: "Marianna i Walentyna",
        ans3: "Matylda i Łucja",
        ans4: "Maryla i Wanda",
        goodAns: 2
    },
    18: {
        questionTitle: "Na czym wyemitowano wizerunek Łukasiewicza?",
        ans1: "Przy każdej szkole w Gorlicach",
        ans2: "Na banknotach",
        ans3: "Na każdej lampie naftowej",
        ans4: "Na monetach",
        goodAns: 4
    },
    19: {
        questionTitle: "Z kim Łukasiewicz badał skład ropy naftowej?",
        ans1: "z Janem Zehem",
        ans2: "z Piotrem Mikolaschem",
        ans3: "z Józefem Łukasiewiczem",
        ans4: "z Franciszkiem Antoniewiczem",
        goodAns: 1
    },
    20: {
        questionTitle: "Jak Łukasiewicz miał na drugie imię?",
        ans1: "Piotr",
        ans2: "Paweł",
        ans3: "Jerzy",
        ans4: "Józef",
        goodAns: 4
    }
    
}

currentQuestion = getRandom(Object.keys(questions).length) + 1;

for (let i = 1; i <= 4; i++) {
    let answer = document.getElementById(i);
    answer.innerHTML = "<p>" + questions[currentQuestion]["ans" + i] + "</p>";
    answer.style.backgroundColor = "var(--mainAccentColor)";
}

question.innerHTML = "<h1>Pytanie " + questionNumber + "</h1><p>" + questions[currentQuestion]["questionTitle"] + "</p>";


answers.forEach(answer => {
    answer.addEventListener("click", function() {animate(answer.id)});
});

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function getRandom(max) {
    return Math.floor(Math.random() * max);
}

function animate(id) {
    if (questions[currentQuestion]["goodAns"] == id) {
        document.getElementById(id).style.backgroundColor = "rgb(90, 235, 50)";
        totalScore += 2500;
    } else {
        document.getElementById(questions[currentQuestion]["goodAns"]).style.backgroundColor = "rgb(90, 235, 50)";
        document.getElementById(id).style.backgroundColor = "rgb(210, 50, 40)";
    }

    question.style.animationName = "slideToLeft";
    answers.forEach(answer => {
        answer.disabled = true;
        answer.style.cursos = "default";
        answer.style.animationName = "slideToLeft";
    });

    quizSummary[questionNumber] = {
        question: currentQuestion,
        userAnswer: id
    };

    if (questionNumber != 10) {
        alreadyAnswered.push(currentQuestion);
        for(let i = 0; i != 1;) {
            let random = getRandom(Object.keys(questions).length) + 1;
            if (alreadyAnswered.length != Object.keys(questions).length) {
                if (alreadyAnswered.includes(random)) {
                    ;
                } else {
                    currentQuestion = random;
                    i = 1;
                }
            } else {
                i = 1;
            }
        }
    }

    sleep(2200).then(() => {
        if (questionNumber != 10) {
            for (let i = 1; i <= 4; i++) {
                let answer = document.getElementById(i);
                answer.innerHTML = "<p>" + questions[currentQuestion]["ans" + i] + "</p>";
                answer.style.backgroundColor = "var(--mainAccentColor)";
            }

            questionNumber++;
            question.innerHTML = "<h1>Pytanie " + questionNumber + "</h1><p>" + questions[currentQuestion]["questionTitle"] + "</p>";

            sleep(1300).then(() => {
                question.style.animationName = "idle";
                answers.forEach(answer => {
                    answer.style.animationName = "idle";
                    answer.disabled = false;
                    answer.style.cursos = "pointer";
                });
            });
        } else {
            // xmlhttp.onload = function() {
            //     func(xmlhttp.responseText)
            // }
        
            // xmlhttp.open("POST", "../functions.php");
            // xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

            // xmlhttp.send("points=" + totalScore);

            let toShow = document.querySelectorAll(".summary");
            let toHide = document.querySelectorAll(".quiz > .question, .answers");

            toShow.forEach(element => {
                element.style.display = "flex";
                element.style.animationName = "slideFromRight";
            });
            toHide.forEach(element => {
                element.style.display = "none";
            });
            
            let pointTitle = document.getElementById("pointTitle");
            let percentage = document.getElementById("percentage");
            let greenBar = document.querySelectorAll(".greenBar");
            let questionsDiv = document.querySelectorAll(".questions");

            const xmlhttp = new XMLHttpRequest();

            xmlhttp.onload = function() {console.log(xmlhttp.responseText);}
            xmlhttp.open("POST", "addQuizRecord.php");
            xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlhttp.send("points=" + totalScore + "$token=" + '<?php echo $_SESSION["token"] ?>');

            pointTitle.innerHTML = "Zdobyłeś " + totalScore + " punktów!";
            percentage.innerHTML = totalScore / 250 + "%";
            greenBar.forEach(element => {
                element.style.width = totalScore / 250 + "%";
            });

            questionsDiv.forEach(element => {
                for (let i = 1; i <= 10; i++) {
                    console.log(i);
                    element.insertAdjacentHTML('beforeend', '<div class="question"><h1>' + questions[quizSummary[i]["question"]]["questionTitle"] + '</h1><div class="answerSum"><div id="' + i + '1"><p>' + questions[quizSummary[i]["question"]]["ans1"] + '</p></div><div id="' + i + '2"><p>' + questions[quizSummary[i]["question"]]["ans2"] + '</p></div><div id="' + i + '3"><p>' + questions[quizSummary[i]["question"]]["ans3"] + '</p></div><div id="' + i + '4"><p>' + questions[quizSummary[i]["question"]]["ans4"] + '</p></div></div></div>');
                }
            });

            for (let i = 1; i <= 10; i++) {
                document.getElementById(parseInt(quizSummary[i]["userAnswer"]) + (i * 10)).style.backgroundColor = "rgb(210, 50, 40)";
                document.getElementById(parseInt(questions[quizSummary[i]["question"]]["goodAns"]) + (i * 10)).style.backgroundColor = "rgb(90, 235, 50)";
            }
        }
    });
}