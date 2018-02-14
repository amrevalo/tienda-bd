<?php
// Constantes y variables globales

define("GET","get");                   // Formularios se envían con GET
define("POST","post");                  // Formularios se envían con POST

define("MYSQL","MySQL");         // Base de datos MySQL
define("SQLITE","SQLite");        // Base de datos SQLITE

define("MENU_PRINCIPAL","menuPrincipal"); // Menú principal
define("MENU_VOLVER","menuVolver");    // Menú Volver a inicio


// Constantes y variables configurables

require_once "config.php";

// Biblioteca base de datos

if ($dbMotor == MYSQL) {
    require_once "biblioteca_mysql.php";
} elseif ($dbMotor == SQLITE) {
    require_once "biblioteca_sqlite.php";
}

// Funciones comunes

function recoge($var)
{
    $tmp = (isset($_REQUEST[$var]))
        ? trim(htmlspecialchars($_REQUEST[$var], ENT_QUOTES, "UTF-8"))
        : "";
    return $tmp;
}

function recogeMatriz($var)
{
    $tmpMatriz = array();
    if (isset($_REQUEST[$var]) && is_array($_REQUEST[$var])) {
        foreach ($_REQUEST[$var] as $indice => $valor) {
            $indiceLimpio = trim(htmlspecialchars($indice, ENT_QUOTES, "UTF-8"));
            $valorLimpio  = trim(htmlspecialchars($valor,  ENT_QUOTES, "UTF-8"));
            $tmpMatriz[$indiceLimpio] = $valorLimpio;
        }
    }
    return $tmpMatriz;
}

function cabecera($texto, $menu)
{
    print "<!DOCTYPE html>\n";
    print "<html lang=\"es\">\n";
    print "  <head>\n";
    print "    <meta charset=\"utf-8\" />\n";
    print "    <title>$texto. Bases de datos Biblioteca \n";
    print "      Ejercicios. PHP. Bartolomé Sintes Marco. www.mclibre.org</title>\n";
    print "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n";
    print "    <link href=\"mclibre_php_soluciones_proyectos.css\" rel=\"stylesheet\" type=\"text/css\" />\n";
    print "  </head>\n";
    print "\n";
    print "  <body>\n";
    print "    <header>\n";
    print "      <h1>Bases de datos Biblioteca - $texto</h1>\n";
    print "\n";
    print "      <nav>\n";
    print "        <ul>\n";
    if ($menu == MENU_PRINCIPAL) {
        print "          <li><a href=\"insertar_1.php\">Añadir registro</a></li>\n";
        print "          <li><a href=\"listar.php\">Listar</a></li>\n";
        print "          <li><a href=\"borrar_1.php\">Borrar</a></li>\n";
        print "          <li><a href=\"buscar_1.php\">Buscar</a></li>\n";
        print "          <li><a href=\"modificar_1.php\">Modificar</a></li>\n";
        print "          <li><a href=\"borrartodo_1.php\">Borrar todo</a></li>\n";
    } elseif ($menu == MENU_VOLVER) {
        print "          <li><a href=\"index.php\">Página inicial</a></li>\n";
    } else {
        print "      <li>Error en la selección de menú</li>\n";
    }
    print "        </ul>\n";
    print "      </nav>\n";
    print "    </header>\n";
    print "\n";
    print "    <main>\n";
}

function pie()
{
    print "    </main>\n";
    print "\n";
    print "    <footer>\n";
    print "      <p class=\"ultmod\">\n";
    print "        Última modificación de esta página:\n";
    print "        <time datetime=\"2016-12-06\">6 de diciembre de 2016</time></p>\n";
    print "\n";
    print "      <p class=\"licencia\">\n";
    print "        El programa PHP que genera esta página está bajo\n";
    print "        <a rel=\"license\" href=\"http://www.gnu.org/licenses/agpl.txt\">licencia AGPL 3 o posterior</a></p>\n";
    print "    </footer>\n";
    print "  </body>\n";
    print "</html>";
}
