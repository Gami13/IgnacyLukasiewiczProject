<?php
session_start();
include_once('functions.php');
/**
 * Dodaje tag head, i header do strony z tytułem pobranym jako argument
 * 
 * @param string $title - Pożądany tytuł
 * 
 * @author Gami (aka Furas)
 */
function giveHead($title)
{

$head = '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>'.$title.'</title>
    <link rel="stylesheet" href="css.css" />
    <script src="index.js"></script>
    <script disable-devtool-auto src="https://fastly.jsdelivr.net/npm/disable-devtool/disable-devtool.min.js"></script>
  </head>

  <body>
    <nav class="navbar">
      <ul class="navbar-nav">
        <li class="logo">
          <a href="index.php" class="nav-link">
            <span class="link-text logo-text">'.$title.'</span>
            <svg aria-hidden="true" focusable="false" data-prefix="fad" data-icon="angle-double-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-angle-double-right fa-w-14 fa-5x"> <g class="fa-group"> <path fill="currentColor" d="M224 273L88.37 409a23.78 23.78 0 0 1-33.8 0L32 386.36a23.94 23.94 0 0 1 0-33.89l96.13-96.37L32 159.73a23.94 23.94 0 0 1 0-33.89l22.44-22.79a23.78 23.78 0 0 1 33.8 0L223.88 239a23.94 23.94 0 0 1 .1 34z" class="fa-secondary" ></path><path fill="currentColor" d="M415.89 273L280.34 409a23.77 23.77 0 0 1-33.79 0L224 386.26a23.94 23.94 0 0 1 0-33.89L320.11 256l-96-96.47a23.94 23.94 0 0 1 0-33.89l22.52-22.59a23.77 23.77 0 0 1 33.79 0L416 239a24 24 0 0 1-.11 34z" class="fa-primary" ></path> </g> 
            </svg>
          </a>
        </li>
        <li class="nav-item">
          <a href="index.php" class="nav-link">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-house-door-fill"
              viewBox="0 0 16 16"
            >
              <path
                class="fa-secondary"
                stroke="currentColor"
                fill="currentColor"
                d="M6.5 14.5v-3.505c0-.245.25-.495.5-.495h2c.25 0 .5.25.5.5v3.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5v-7a.5.5 0 0 0-.146-.354L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293L8.354 1.146a.5.5 0 0 0-.708 0l-6 6A.5.5 0 0 0 1.5 7.5v7a.5.5 0 0 0 .5.5h4a.5.5 0 0 0 .5-.5z"
              />
            </svg>
            <span class="link-text">Strona Główna</span>
          </a>
        </li>

        <li class="nav-item">
          <a href="life.php" class="nav-link">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-person-fill"
              viewBox="0 0 16 16"
            >
              <path
                class="fa-secondary"
                stroke="currentColor"
                fill="currentColor"
                d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"
              />
            </svg>
            <span class="link-text">Życiorys</span>
          </a>
        </li>

        <li class="nav-item">
          <a href="game.php" class="nav-link">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dice-2-fill" viewBox="0 0 16 16">
          <path class="fa-secondary" stroke="currentColor" fill="currentColor" d="M0 3a3 3 0 0 1 3-3h10a3 3 0 0 1 3 3v10a3 3 0 0 1-3 3H3a3 3 0 0 1-3-3V3zm5.5 1a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0zm6.5 9.5a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z"/>
        </svg>
            <span class="link-text">Gra</span>
          </a>
        </li>

        <li class="nav-item">
          <a href="quizStart.php" class="nav-link">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-question-circle-fill"
              viewBox="0 0 16 16"
            >
              <path
                class="fa-secondary"
                stroke="transparent"
                fill="currentColor"
                d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.496 6.033h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286a.237.237 0 0 0 .241.247zm2.325 6.443c.61 0 1.029-.394 1.029-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94 0 .533.425.927 1.01.927z"
              />
            </svg>
            <span class="link-text">Quiz</span>
          </a>
        </li>

        <li class="nav-item">
          <a href="gallery.php" class="nav-link">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-image-fill"
              viewBox="0 0 16 16"
            >
              <path
                class="fa-secondary"
                stroke="currentColor"
                fill="currentColor"
                d="M.002 3a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-12a2 2 0 0 1-2-2V3zm1 9v1a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V9.5l-3.777-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12zm5-6.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0z"
              />
            </svg>
            <span class="link-text">Galeria Zdjęć</span>
          </a>
        </li>
        <li class="nav-item">
          <a href="map.php" class="nav-link">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-map-fill"
              viewBox="0 0 16 16"
            >
              <path
                class="fa-secondary"
                stroke="transparent"
                fill="currentColor"
                fill-rule="evenodd"
                d="M16 .5a.5.5 0 0 0-.598-.49L10.5.99 5.598.01a.5.5 0 0 0-.196 0l-5 1A.5.5 0 0 0 0 1.5v14a.5.5 0 0 0 .598.49l4.902-.98 4.902.98a.502.502 0 0 0 .196 0l5-1A.5.5 0 0 0 16 14.5V.5zM5 14.09V1.11l.5-.1.5.1v12.98l-.402-.08a.498.498 0 0 0-.196 0L5 14.09zm5 .8V1.91l.402.08a.5.5 0 0 0 .196 0L11 1.91v12.98l-.5.1-.5-.1z"
              />
            </svg>
            <span class="link-text">Mapa</span>
          </a>
        </li>
        '; 
        if (isLoggedIn()) {
          $head .= '<li class="nav-item">
                      <a href="wyloguj.php" class="nav-link">
                      <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
          <path class="fa-secondary"
          stroke="currentColor"
          fill="currentColor" d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
        </svg>
                        <span class="link-text"">Wyloguj się</span>
                      </a>
                    </li>';
        } else {
          $head .= '<li class="nav-item">
          <a href="login.php" class="nav-link">
          <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-key-fill" viewBox="0 0 16 16">
          <path class="fa-secondary"
          stroke="currentColor"
          fill="currentColor" d="M3.5 11.5a3.5 3.5 0 1 1 3.163-5H14L15.5 8 14 9.5l-1-1-1 1-1-1-1 1-1-1-1 1H6.663a3.5 3.5 0 0 1-3.163 2zM2.5 9a1 1 0 1 0 0-2 1 1 0 0 0 0 2z"/>
        </svg>
            <span class="link-text">Zaloguj się</span>
          </a>
        </li>';
        }
        $head .= '</ul></nav><div class="headerSpacing"></div><main id="main">';
      echo $head;
}
