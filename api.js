const question = document.getElementById("question");
const answers = document.querySelectorAll(".answers > *");
var currentQuestion = 1;
var questionNumber = 1;
var Xdkasodksa = 0;
var randomAnsPos = [1, 2, 3, 4];
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
        ans4: "Arystokratą",
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
        questionTitle: "Jak nazywa się film dokumentalny o Łukasiewiczu, który powstał w 2009r?",
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
        ans1: "Z Janem Zehem",
        ans2: "Z Piotrem Mikolaschem",
        ans3: "Z Józefem Łukasiewiczem",
        ans4: "Z Franciszkiem Antoniewiczem",
        goodAns: 1
    },
    20: {
        questionTitle: "Jak Łukasiewicz miał na drugie imię?",
        ans1: "Piotr",
        ans2: "Paweł",
        ans3: "Jerzy",
        ans4: "Józef",
        goodAns: 4
    },
    21: {
        questionTitle: "Jak nazywa się szlak naftowy rozpoczynający się w Gorlicach?",
        ans1: "Gorlicki szlak naftowy",
        ans2: "Karpacko Galicyjski Szlak Naftowy",
        ans3: "Śladami Ignacego Łukasiewicza",
        ans4: "Małopolski Szlak naftowy",
        goodAns: 2
    },
    22: {
        questionTitle: "Do czego po raz pierwszy Ignacy Łukasiewicz użył lampy naftowej?",
        ans1: "Do oświetlenia ulicy",
        ans2: "Do ogrzewania pomieszczenia",
        ans3: "Do oświetlenia wystawy w aptece",
        ans4: "Jako oświetlenia swojej apteki",
        goodAns: 3
    },
    23: {
        questionTitle: "Gdzie znajdowała się apteka w której Ignacy Łukasiewicz prowadził destylacje ropy?",
        ans1: "W obecnym Muzeum PTTK im. Ignacego Łukasiewicza w Gorlicach",
        ans2: "W Gorlickim Ratuszu",
        ans3: "W obecnym Skansenie Przemysłu Naftowego MAGDALENA w Gorlicach",
        ans4: "W obecnej Bieckiej aptece Dr.Max ",
        goodAns: 2
    },
    24: {
        questionTitle: "Jak nazywało się urządzenie do destylacji ropy?",
        ans1: "Destylator",
        ans2: "Wentylator",
        ans3: "Ropownik",
        ans4: "Alembik",
        goodAns: 4
    },
    25: {
        questionTitle: "Ktory rok został ogłoszony rokiem Łukasiewicza?",
        ans1: "1992",
        ans2: "2023",
        ans3: "2022",
        ans4: "1922",
        goodAns: 3
    },
    26: {
        questionTitle: "Gdzie można obejrzeć orginalne urządzenie do destylacji ropy używany przez Łukasiewicza?",
        ans1: "W Skansenie Przemysłu Naftowego MAGDALENA w Gorlicach",
        ans2: "W muzeum Mikolascha POD ZŁOTĄ GWIAZDĄ we Lwowie",
        ans3: "W muzeum Przemysłu Naftowego i Gazowniczego im. Ignacego Łukasiewicza w Bóbrce",
        ans4: "W Gorlickim Ratuszu",
        goodAns: 1
    },
    27: {
        questionTitle: "Z jaką organizacją związał się Ignacy Łukasiewicz?",
        ans1: "Związkiem Wolnych Polaków",
        ans2: "Towarzystwem Patriotycznym",
        ans3: "Związkiem fanów Lampy Naftowej",
        ans4: "Towarzystwem Demokratycznym Polskim",
        goodAns: 4
    },
    28: {
        questionTitle: "Jak dziś nazywany jest Ignacy Łukasiewicz?",
        ans1: "Pionerem nowoczesnego budownictwa",
        ans2: "Twórcą przemysłu naftowego i rafineryjnego",
        ans3: "Organizatorem imprez o tematyce lamp naftowych",
        ans4: "Prekursorem elektrotechniki",
        goodAns: 2
    },
    29: {
        questionTitle: "Jakie najważniejsze cechy miał wynalazek Łukasiewicza?",
        ans1: "Dawał wysoką temperaturę, zajmował mało miejsca i wystarczył na długo",
        ans2: "Był skuteczny przy leczeniu chorób zakaźnych, zwalczał bakterie",
        ans3: "Był tańszy niż inne surowce wykorzystywane do oświetlenia",
        ans4: "Produkował substancję wykorzystywane do udoskonalenia chemii",
        goodAns: 3
    },
    30: {
        questionTitle: "Jakie sektory branż bazują dziś na zapoczątkowanym przez Łukasiewicza procesie chemicznym?",
        ans1: "Paliwowy i chemiczny",
        ans2: "Spożywczy i rolny",
        ans3: "Aptekarski",
        ans4: "Rozrywkowy",
        goodAns: 1
    },
    31: {
        questionTitle: "Kim był jeszcze Łukasiewicz?",
        ans1: "Posłem na Sejm galicyjski IV kadencji",
        ans2: "Konsulem",
        ans3: "Przewodniczącym ówczesnych związków zawodowych",
        ans4: "Delegatem ds.gospodarczyk",
        goodAns: 1
    },
    32: {
        questionTitle: "Za co Łukasiewicz został oznaczony Orderem Św. Grzegorza i tutułem szambelana?",
        ans1: "Za budowanie przyparafialnych noclegowni dla bezdomnych ",
        ans2: "Za obdarowywanie bezdomych potrzebnymi przedmiotami",
        ans3: "Za działalność charytatywną i wspieranie kościoła",
        ans4: "Za dokonanie odkrycia wiele znaczącym dla świata",
        goodAns: 3
    },
    33: {
        questionTitle: "Jak mieszkańcy nazywali drogę na którą Łukasiewicz przeznaczył własne środki?",
        ans1: "Ulicą Łukasiewicza",
        ans2: "Drogą ojca lamp naftowych",
        ans3: "Traktem naftowym",
        ans4: "Brukowanymi guldenami Łukasiewicza",
        goodAns: 4
    },
    34: {
        questionTitle: "Nad czym początkowo pracował Łukasiewicz?",
        ans1: "Nad usprawnieniem produkcji spirytusu",
        ans2: "Nad destylacją ropy naftowej w celu otrzymania leku na choroby skóry",
        ans3: "Nad maścią stomatologiczną",
        ans4: "Nad magnetyczną metodą wzbogacenia rud żelaza",
        goodAns: 2
    },
    35: {
        questionTitle: "Którą rocznicę urodzin Łukasiewicza obchodzmy w tym roku?",
        ans1: "100",
        ans2: "50",
        ans3: "300",
        ans4: "200",
        goodAns: 4
    }

    
}

currentQuestion = getRandom(Object.keys(questions).length) + 1;

shuffleArray(randomAnsPos);
for (let i = 1; i <= 4; i++) {
    let answer = document.getElementById(i);
    answer.innerHTML = "<p>" + questions[currentQuestion]["ans" + randomAnsPos[i - 1]] + "</p>";
    answer.style.backgroundColor = "var(--mainAccentColor)";
}

question.innerHTML = "<h1>Pytanie " + questionNumber + "</h1><p>" + questions[currentQuestion]["questionTitle"] + "</p>";


answers.forEach(answer => {
    answer.addEventListener("click", function() {animate(answer.id)});
});

function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function getRandom(max) {
    return Math.floor(Math.random() * max);
}

function animate(id) {
    if (questions[currentQuestion]["goodAns"] == id) {
        document.getElementById(id).style.backgroundColor = "rgb(90, 235, 50)";
        Xdkasodksa += 2500;
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
            
            shuffleArray(randomAnsPos);

            for (let i = 1; i <= 4; i++) {
                let answer = document.getElementById(i);
                answer.innerHTML = "<p>" + questions[currentQuestion]["ans" + randomAnsPos[i - 1]] + "</p>";
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

            // xmlhttp.send("points=" + Xdkasodksa);

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
            xmlhttp.send("points=" + Xdkasodksa + "$token=" + token);

            pointTitle.innerHTML = "Zdobyłeś " + Xdkasodksa + " punktów!";
            percentage.innerHTML = Xdkasodksa / 250 + "%";
            greenBar.forEach(element => {
                element.style.width = Xdkasodksa / 250 + "%";
            });

            questionsDiv.forEach(element => {
                for (let i = 1; i <= 10; i++) {
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