<?php
include_once('header.php');
giveHead('Galeria');
?>

<div class="galleryGrid">
    <?php

    $sql = "SELECT id, title, imageLink FROM gallery";
    $result = $mysqli->query($sql); //users.email


    if ($result->num_rows != 0)
    {
        while ($row = $result->fetch_assoc())
        {

            echo '
                <div id="image' . $row["id"] . '" onclick="popUp(' . $row["id"] . ')" class="obrazek">
                    <img src="images/' . $row["id"] . '.jpg" alt="' . $row["title"] . '" lodaing="lazy">
                    <span>' . $row["title"] . '</span>
                </div>
                ';
        }
    }
    else
    {
        $error .= "Wystąpił niespodziewany błąd";
    }


    ?>




</div>






<script>
    let insertable = document.createElement("div");
    insertable.id = 'fullscreenImage';
    insertable.classList.add('fullscreenImage');
    insertable.classList.add('hidden');

    document.body.insertBefore(insertable, document.getElementById('main'));
    document.getElementById("fullscreenImage").addEventListener("click", function(e) {
        if (this == e.target || e.target != document.getElementById("oneImage").getElementsByTagName("img")[0]) {
            document.getElementById('fullscreenImage').classList.add('hidden');
        }
    })


    function popUp(id) {

        let popUp = document.getElementById('fullscreenImage');
        popUp.classList.remove('hidden');
        let singleImage = document.createElement("div");
        singleImage.id = 'oneImage';
        singleImage.innerHTML = document.getElementById('image' + id).innerHTML
        popUp.innerHTML = singleImage.outerHTML;
        popUp.innerHTML += '<div onclick="closePopUp()" class="closePopUp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16"><path fill-rule="evenodd" d="M13.854 2.146a.5.5 0 0 1 0 .708l-11 11a.5.5 0 0 1-.708-.708l11-11a.5.5 0 0 1 .708 0Z"/><path fill-rule="evenodd" d="M2.146 2.146a.5.5 0 0 0 0 .708l11 11a.5.5 0 0 0 .708-.708l-11-11a.5.5 0 0 0-.708 0Z"/></svg></div>'
        console.log(document.getElementById("oneImage").getElementsByTagName("img")[0]);


    }

    function closePopUp() {
        document.getElementById('fullscreenImage').classList.add('hidden');

    }
</script>

<?php
include_once('footer.html')
?>