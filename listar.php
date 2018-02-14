<?php
// Bases de datos Biblioteca - listar.php

require_once "biblioteca.php";

$db = conectaDb();
cabecera("Listar", MENU_VOLVER);

$consulta = "SELECT COUNT(*) FROM $dbTabla";
$result = $db->query($consulta);
if (!$result) {
    print "      <p>Error en la consulta.</p>\n";
} elseif ($result->fetchColumn() ==0 ) {
    print "      <p>No se ha creado todavía ningún registro.</p>\n";
} else {
    $consulta = "SELECT * FROM $dbTabla";
    $result = $db->query($consulta);
    if (!$result) {
        print "      <p>Error en la consulta.</p>\n";
    } else {
        print "      <p>Listado completo de registros:</p>\n";
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
