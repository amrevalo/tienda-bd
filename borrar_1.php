<?php
// Bases de datos Biblioteca - borrar_1.php
 
require_once "biblioteca.php";

$db = conectaDb();
cabecera("Borrar 1", MENU_VOLVER);

$consulta = "SELECT COUNT(*) FROM $dbTabla";
$result = $db->query($consulta);
if (!$result) {
    print "      <p>Error en la consulta.</p>\n";
} elseif ($result->fetchColumn() == 0) {
    print "      <p>No se ha creado todavía ningún registro.</p>\n";
} else {
    $consulta = "SELECT * FROM $dbTabla";
    $result = $db->query($consulta);
    if (!$result) {
        print "      <p>Error en la consulta.</p>\n";
    } else {
        print "      <form action=\"borrar_2.php\" method=\"" . FORM_METHOD . "\">\n";
        print "        <p>Marque los registros que quiera borrar:</p>\n";
        print "\n";
        print "        <table class=\"conborde franjas\">\n";
        print "          <thead>\n";
        print "            <tr>\n";
        print "              <th>Borrar</th>\n";
        print "              <th>Nombre</th>\n";
        print "              <th>Apellidos </th>\n";
        print "              <th>Telefono </th>\n";
        print "              <th>Email </th>\n";
        print "            </tr>\n";
        print "          </thead>\n";
        print "          <tbody>\n";
        foreach ($result as $valor) {
            print "            <tr>\n";
            print "              <td class=\"centrado\"><input type=\"checkbox\" name=\"id[$valor[id]]\" /></td>\n";
            print "              <td>$valor[nombre]</td>\n";
            print "              <td>$valor[apellidos]</td>\n";
            print "              <td>$valor[telefono]</td>\n";
            print "              <td>$valor[email]</td>\n";
            print "            </tr>\n";
        }
        print "          </tbody>\n";
        print "        </table>\n";
        print "\n";
        print "        <p>\n";
        print "          <input type=\"submit\" value=\"Borrar registro\" />\n";
        print "          <input type=\"reset\" value=\"Reiniciar formulario\" />\n";
        print "        </p>\n";
        print "      </form>\n";
    }
}

$db = null;
pie();
