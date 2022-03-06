    <?php
    include_once("header.php");

$error = "";
if (isset($_POST['username']))
{

    if (!preg_match('/([A-Za-z.\-\_0-9]){2,48}/', $_POST['username']))
    {
        $error .= "Nazwa użytkownika powinna składać się tylko z liter, cyfr oraz znaków .-_ oraz mieć conajmniej 2 litery ale nie więcej niż 48<br>";
    }
    if (!preg_match('/([^][()<>@,;:\\". \x00-\x1F\x7F]+|"(\n|(\\\r)*([^"\\\r\n]|\\[^\r]))*(\\\r)*")(\.([^][()<>@,;:\\". \x00-\x1F\x7F]+|"(\n|(\\\r)*([^"\\\r\n]|\\[^\r]))*(\\\r)*"))*@([^][()<>@,;:\\". \x00-\x1F\x7F]+|\[(\n|(\\\r)*([^][\\\r\n]|\\[^\r]))*(\\\r)*])(\.([^][()<>@,;:\\". \x00-\x1F\x7F]+|\[(\n|(\\\r)*([^][\\\r\n]|\\[^\r]))*(\\\r)*]))*/', $_POST['email'] ))
    {
        $error .= "Podany e-mail jest nie prawidłowy<br>";
    }
    if (!preg_match( "/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/", $_POST['password'],) || !preg_match( "/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,64}$/",$_POST['passwordConfirm'],))
    {
        $error .= "Hasła są niepoprawne. Hasło musi składać się z conajmniej 8 i maksymalnie 64 znaków. Musi zawierać conajmniej 1 litere i conajmniej 1 cyfre<br>";
    }
    if ($_POST['password'] != $_POST['passwordConfirm'])
    {
        $error .= "Hasłą nie są identyczne";
    }
    if ($error == NULL) //sprawdzanie czy nazwa jest dostepna
    {

        // prepare and bind
        $stmt = $mysqli->prepare("SELECT users.id FROM users WHERE users.username = ? ");//users.email
        $stmt->bind_param("s", $_POST['username']);
        $stmt->execute();
        $stmt -> store_result();

/* Bind results */
       // $stmt -> bind_result($testfield1, $testfield2, $testfield3);

/* Fetch the value */
        //$stmt -> fetch();
        if($stmt->num_rows()==0)
        {
            echo "gituwa";
        }
        else{
            $error .= "Nazwa uzytkownika jest zajeta";
        }
    }
    if ($error == NULL)//sprawdzanie dostepnosci maila
    {

        // prepare and bind
        $stmt = $mysqli->prepare("SELECT users.id FROM users WHERE users.email = ? ");//
        $stmt->bind_param("s", $_POST['email']);
        $stmt->execute();
        $stmt -> store_result();

        if($stmt->num_rows()==0)
        {
            echo "gituwa";
        }
        else{
            $error .= "E-mail jest zajety";
        }
    }
    
    if ($error == NULL)//wstawianie do bazy
    {
        $username = $_POST['username'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $salt = base64_encode(random_bytes(4));
        $pepper = "7u613W0up3";
        $password = $salt . $password . $pepper;
        $token = base64_encode(random_bytes(189));
        $password = password_hash($password, PASSWORD_DEFAULT);

        $sql = "INSERT INTO users(`username`, `email`, `password`,`salt`,`token`) VALUES (?, ?, ?, ?, ?)";
        echo $sql;
        $stmt = $mysqli->prepare($sql);//users.email
        $stmt->bind_param("sssss", $username, $email, $password, $salt, $token);
        if ($stmt->execute()){
            echo "SUKCES";
            header("location: index.php");
        }
        else
        {
            $error .= "UwU somethin went wong";
        }
    }
    echo $error;
}

giveHead("Register");
?>
<main class="main centerContent">

<form method="POST" class="registerForm">
    <h1>Zarejestruj się</h1>
    <div class="input">


        <svg version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 60 60" style="enable-background:new 0 0 60 60;" xml:space="preserve">
            <path d="M48.014,42.889l-9.553-4.776C37.56,37.662,37,36.756,37,35.748v-3.381c0.229-0.28,0.47-0.599,0.719-0.951c1.239-1.75,2.232-3.698,2.954-5.799C42.084,24.97,43,23.575,43,22v-4c0-0.963-0.36-1.896-1-2.625v-5.319c0.056-0.55,0.276-3.824-2.092-6.525C37.854,1.188,34.521,0,30,0s-7.854,1.188-9.908,3.53C17.724,6.231,17.944,9.506,18,10.056v5.319c-0.64,0.729-1,1.662-1,2.625v4c0,1.217,0.553,2.352,1.497,3.109c0.916,3.627,2.833,6.36,3.503,7.237v3.309c0,0.968-0.528,1.856-1.377,2.32l-8.921,4.866C8.801,44.424,7,47.458,7,50.762V54c0,4.746,15.045,6,23,6s23-1.254,23-6v-3.043C53,47.519,51.089,44.427,48.014,42.889z" />
        </svg>

        <input type="text" name="username" placeholder="Nazwa Użytkownika" required minlength="2" maxlength="48" pattern="([A-Za-z.\-\_0-9]){2,48}">
    </div>

    <div class="input">
        <svg viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path d="M1.574 5.286l7.5 4.029c.252.135.578.199.906.199.328 0 .654-.064.906-.199l7.5-4.029c.489-.263.951-1.286.054-1.286H1.521c-.897 0-.435 1.023.053 1.286zm17.039 2.203l-7.727 4.027c-.34.178-.578.199-.906.199s-.566-.021-.906-.199-7.133-3.739-7.688-4.028C.996 7.284 1 7.523 1 7.707V15c0 .42.566 1 1 1h16c.434 0 1-.58 1-1V7.708c0-.184.004-.423-.387-.219z" />
        </svg>

        <input type="email" name="email" placeholder="E-Mail" required minlength="3" pattern='(?:[a-z0-9!#$%&*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])'>
    </div>

    <div class="input">
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 330 330" style="enable-background:new 0 0 330 330;" xml:space="preserve">
            <g id="XMLID_486_">
                <path id="XMLID_487_" d="M165,330c63.411,0,115-51.589,115-115c0-29.771-11.373-56.936-30-77.379V85c0-46.869-38.131-85-85-85S80.001,38.131,80.001,85v52.619C61.373,158.064,50,185.229,50,215C50,278.411,101.589,330,165,330z M180,219.986V240c0,8.284-6.716,15-15,15s-15-6.716-15-15v-20.014c-6.068-4.565-10-11.824-10-19.986c0-13.785,11.215-25,25-25s25,11.215,25,25C190,208.162,186.068,215.421,180,219.986z M110.001,85c0-30.327,24.673-55,54.999-55c30.327,0,55,24.673,55,55v29.029C203.652,105.088,184.91,100,165,100c-19.909,0-38.651,5.088-54.999,14.028V85z" />
            </g>

        </svg>
        <input type="password" name="password" placeholder="Hasło" required minlength="8" maxlength="64" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,64}$">
    </div>

    <div class="input">
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 330 330" style="enable-background:new 0 0 330 330;" xml:space="preserve">
            <g id="XMLID_486_">
                <path id="XMLID_487_" d="M165,330c63.411,0,115-51.589,115-115c0-29.771-11.373-56.936-30-77.379V85c0-46.869-38.131-85-85-85S80.001,38.131,80.001,85v52.619C61.373,158.064,50,185.229,50,215C50,278.411,101.589,330,165,330z M180,219.986V240c0,8.284-6.716,15-15,15s-15-6.716-15-15v-20.014c-6.068-4.565-10-11.824-10-19.986c0-13.785,11.215-25,25-25s25,11.215,25,25C190,208.162,186.068,215.421,180,219.986z M110.001,85c0-30.327,24.673-55,54.999-55c30.327,0,55,24.673,55,55v29.029C203.652,105.088,184.91,100,165,100c-19.909,0-38.651,5.088-54.999,14.028V85z" />
            </g>

        </svg>
        <input type="password" name="passwordConfirm" placeholder="Potwierdź Hasło" minlength="8" maxlength="64" pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,64}$">
    </div>

    <input type="submit" value="Zarejestruj">
    <a href="login.php">Zaloguj się</a>
</form>
</main>
</body>
</html>

