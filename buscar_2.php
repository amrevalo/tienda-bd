<?php
// Bases de datos Biblioteca - buscar_2.php

require_once "biblioteca.php";

$db = conectaDb();
cabecera("Buscar 2", MENU_VOLVER);

$nombre    = recoge("nombre");
$apellidos = recoge("apellidos");
$telefono = recoge("telefono");
$email = recoge("email");

$consulta = "SELECT COUNT(*) FROM $dbTabla
    WHERE nombre LIKE :nombre
    AND apellidos LIKE :apellidos
    AND telefono LIKE :telefono
    AND email LIKE :email";
$result = $db->prepare($consulta);
$result->execute(array(":nombre" => "%$nombre%", ":apellidos" => "%$apellidos%", ":telefono" => "%$telefono%", ":email" => "%$email%"));
if (!$result) {
    print "      <p>Error en la consulta.</p>\n";
} elseif ($result->fetchColumn() == 0) {
    print "      <p>No se han encontrado registros.</p>\n";
} else {
    $consulta = "SELECT * FROM $dbTabla
        WHERE nombre LIKE :nombre
        AND apellidos LIKE :apellidos
        AND telefono LIKE :telefono
        AND email LIKE :email";
    $result = $db->prepare($consulta);
    $result->execute(array(":nombre" => "%$nombre%", ":apellidos" => "%$apellidos%", ":telefono" => "%$telefono%", ":email" => "%$email%"));
    if (!$result) {
        print "      <p>Error en la consulta.</p>\n";
    } else {
        print "      <p>Registros encontrados:</p>\n";
        print "\n";
        print "      <table class=\"conborde franjas\">\n";
        print "        <thead>\n";
        print "          <tr>\n";
        print "            <th>Nombre</th>\n";
        print "            <th>Apellidos </th>\n";
        print "            <th>Telefono </th>\n";
        print "            <th>Email </th>\n";
        print "          </tr>\n";
        print "        </thead>\n";
        print "        <tbody>\n";
        foreach ($result as $valor) {
            print "          <tr>\n";
            print "            <td>$valor[nombre]</td>\n";
            print "            <td>$valor[apellidos]</td>\n";
            print "            <td>$valor[telefono]</td>\n";
            print "            <td>$valor[email]</td>\n";
            print "          </tr>\n";
        }
        print "        </tbody>\n";
        print "      </table>\n";
    }
}

$db = null;
pie();
