<?php
include_once('header.php');
?>
    <?php

if (isset($_POST['username']) && isset($_POST['password']) )
{

    //check if user exists - DONE
    $error = "";
    $sql = "SELECT users.id FROM users WHERE users.username = ? OR users.email = ?";
    //SELECT users.id, users.username, users.email, users.password, users.salt, users.token, users.karma, users.banStatus, users.rank, users.creationDate, users.avatar, users.liked, users.followed, users.inGroups FROM users WHERE users.username = ? 
    $stmt = $mysqli->prepare($sql); //users.email
    $stmt->bind_param("ss", $_POST['username'], $_POST['username']);
    $stmt->execute();
    $stmt->store_result();

    /* Bind results */
    // $stmt -> bind_result($testfield1, $testfield2, $testfield3);

    /* Fetch the value */
    //$stmt -> fetch();
    if ($stmt->num_rows() == 1)
    {
        ;
    }
    else
    {
        $error .= "Taki uzytkownik nie istnieje";
    }


    if ($error == NULL) //check if passwords match - DONE
    {
        $sql = "SELECT users.password, users.salt FROM users WHERE users.email = ? OR users.username = ?";
        $stmt = $mysqli->prepare($sql); //users.email
        $stmt->bind_param("ss", $_POST['username'], $_POST['username']);
        $stmt->execute();
        $stmt->store_result();

        $stmt->bind_result($hashedPassword, $salt);

        $stmt->fetch();
        if ($stmt->num_rows() == 1)
        {
            $password = $_POST['password'];
            $pepper = "7u613W0up3";
            $password = $salt . $password . $pepper;
            if (password_verify($password, $hashedPassword))
            {
            }
            else
            {
                $error .= "Nie poprawne hasło";
            }
        }
        else
        {
            $error .= "Wystąpił niespodziewany błąd";
        }
    }







    if ($error == NULL) //add user data to session
    {
        $sql = "SELECT users.id, users.username, users.email, users.token, users.banStatus FROM users WHERE users.email = ? OR users.username = ?";
        $stmt = $mysqli->prepare($sql); //users.email
        $stmt->bind_param("ss", $_POST['username'], $_POST['username']);
        $stmt->execute();
        $stmt->store_result();

        $stmt->bind_result($id, $username, $email, $token, $banStatus);

        $stmt->fetch();
        if ($stmt->num_rows() == 1)
        {
            $_SESSION['id'] = $id;
            $_SESSION['username'] = $username;
            $_SESSION['email'] = $email;
            $_SESSION['token'] = $token;
            $_SESSION['banStatus'] = $banStatus;
            $_SESSION['loggedIn'] = "true";
            header('location: index.php');
        }
        else
        {
            $error .= "Wystąpił niespodziewany błąd";
        }
    }



    echo $error;




    //SELECT users.id, users.username, users.email, users.password, users.salt, users.token, users.karma, users.banStatus, users.rank, users.creationDate, users.avatar, users.liked, users.followed, users.inGroups FROM users WHERE users.email = ? OR users.username = ?








}

giveHead("Login")

?>
<div class="centerContent" style="height: 100vh;">


<form method="POST" class="registerForm">
    <h1>Zaloguj się</h1>
    <div class="input">


        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
            <path d="M48.014,42.889l-9.553-4.776C37.56,37.662,37,36.756,37,35.748v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C42.084,24.97,43,23.575,43,22v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C37.854,1.188,34.521,0,30,0s-7.854,1.188-9.908,3.53C17.724,6.231,17.944,9.506,18,10.056v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C8.801,44.424,7,47.458,7,50.762V54c0,4.746,15.045,6,23,6s23-1.254,23-6v-3.043C53,47.519,51.089,44.427,48.014,42.889z" />
        </svg>

        <input type="text" name="username" placeholder="Nazwa Użytkownika" required>
    </div>


    <div class="input">
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 330 330" style="enable-background:new 0 0 330 330;" xml:space="preserve">
            <g id="XMLID_486_">
                <path id="XMLID_487_" d="M165,330c63.411,0,115-51.589,115-115c0-29.771-11.373-56.936-30-77.379V85c0-46.869-38.131-85-85-85S80.001,38.131,80.001,85v52.619C61.373,158.064,50,185.229,50,215C50,278.411,101.589,330,165,330z M180,219.986V240c0,8.284-6.716,15-15,15s-15-6.716-15-15v-20.014c-6.068-4.565-10-11.824-10-19.986c0-13.785,11.215-25,25-25s25,11.215,25,25C190,208.162,186.068,215.421,180,219.986z M110.001,85c0-30.327,24.673-55,54.999-55c30.327,0,55,24.673,55,55v29.029C203.652,105.088,184.91,100,165,100c-19.909,0-38.651,5.088-54.999,14.028V85z" />
            </g>
        </svg>
        <input type="password" name="password" placeholder="Hasło" required minlength="6" maxlength="64" pattern="^.{6,64}$">
    </div>



    <input type="submit" value="Zaloguj">
    <a href="register.php">Zarejestruj się</a>
</form>

</div>

<!-- $error = "";
if(isset($_SESSION['loggedIn']))
{


if($_SESSION['loggedIn'] == "true")
{
    if ($error == NULL) //add user data to session
    {
        $sql = "SELECT users.id, users.username, users.email, users.token FROM users WHERE users.id = ?";
        $stmt = $mysqli->prepare($sql); //users.email
        $stmt->bind_param("s", $_SESSION['id']);
        $stmt->execute();
        $stmt->store_result();

        $stmt->bind_result($id, $username, $email, $token);

        $stmt->fetch();
        if ($stmt->num_rows() == 1)
        {
            if($_SESSION['id'] == $id 
            && $_SESSION['username']==$username 
            && $_SESSION['email'] == $email 
            && $_SESSION['token'] == $token)
            {
                $_SESSION['loggedIn'] = "true";
       
            }
            else 
            {
                $_SESSION['loggedIn'] = "false";
 


            }

        }
        else
        {
            $error .= "Wystąpił niespodziewany błąd";
        }
    }
}


if($_SESSION['loggedIn'] == "true")
{
    echo '<h1>Jesteś zalogowany!</h1> <p>Twoja nazwa to '.$_SESSION['username'].'</p> <form method="post">
    <input type="submit" name="wyloguj" value="Wyloguj!" />
</form>';
}
}
else{
    echo '<h1>Nie jesteś zalogowany</h1> <br><form method="post">
    <input type="submit" name="zaloguj" value="Zaloguj!" />
</form>';
}

if(isset($_POST['wyloguj']))
{
    session_unset();
    session_destroy();
    header("Refresh:0");
}
if(isset($_POST['zaloguj']))
{
    header('location: login.php');
} -->

<?php
include_once('footer.html');
?>