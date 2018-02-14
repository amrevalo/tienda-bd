<?php
// Bases de datos Biblioteca - borrartodo_1.php

require_once "biblioteca.php";

cabecera("Borrar todo 1", MENU_VOLVER);

print "      <form action=\"borrartodo_2.php\" method=\"" . FORM_METHOD . "\">\n";
print "        <p>¿Está seguro?</p>\n";
print "\n";
print "        <p>\n";
print "          <input type=\"submit\" value=\"Sí\" name=\"si\" />\n";
print "          <input type=\"submit\" value=\"No\" name=\"no\" />\n";
print "        </p>\n";
print "      </form>\n";
print "\n";

pie();
