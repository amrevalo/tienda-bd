<?php
// Bases de datos Biblioteca - borrar_2.php

require_once "biblioteca.php";

$db = conectaDb();
cabecera ("Borrar 2", MENU_VOLVER);

$id = recogeMatriz("id");

if (count($id) == 0) {
    print "      <p>No se ha seleccionado ningún registro.</p>\n";
} else {
    foreach ($id as $indice => $valor) {
        $consulta = "SELECT COUNT(*) FROM $dbTabla
            WHERE id=:indice";
        $result = $db->prepare($consulta);
        $result->execute(array(":indice" => $indice));
        if (!$result) {
            print "      <p>Error en la consulta.</p>\n";
        } elseif ($result->fetchColumn() == 0) {
            print "      <p>Registro no encontrado.</p>\n";
        } else {
            $consulta = "DELETE FROM $dbTabla
                WHERE id=:indice";
            $result = $db->prepare($consulta);
            if ($result->execute(array(":indice" => $indice))) {
                print "      <p>Registro borrado correctamente.</p>\n";
            } else {
                print "      <p>Error al borrar el registro.</p>\n";
            }
        }
    }
}

$db = null;
pie();
