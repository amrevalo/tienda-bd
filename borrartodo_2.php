<?php
// Bases de datos Biblioteca - borrartodo_2.php

require_once "biblioteca.php";

if (!isset($_REQUEST["si"])) {
    header("Location:index.php");
    exit();
} else {
    $db = conectaDb();
    cabecera("Borrar todo 2", MENU_VOLVER);
    borraTodo($db);
    $db = null;
    pie();
}
