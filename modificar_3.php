<?php
// Bases de datos Biblioteca - modificar_3.php

require_once "biblioteca.php";

$db = conectaDb();
cabecera("Modificar 3", MENU_VOLVER);

$nombre      = recoge("nombre");
$apellidos   = recoge("apellidos");
$telefono    = recoge("telefono");
$email       = recoge("email");
$id          = recoge("id");

$nombreOk    = false;
$apellidosOk = false;
$telefonoOk = false;
$emailOk = false;

if (mb_strlen($nombre, "UTF-8") > $tamNombre) {
    print "      <p class=\"aviso\">El nombre no puede tener más de $tamNombre caracteres.</p>\n";
    print "\n";
} else {
    $nombreOk = true;
}

if (mb_strlen($apellidos, "UTF-8") > $tamApellidos) {
    print "      <p class=\"aviso\">Los apellidos no pueden tener más de $tamApellidos caracteres.</p>\n";
    print "\n";
} else {
    $apellidosOk = true;
}

if (mb_strlen($telefono, "UTF-8") > $tamTelefono) {
    print "      <p class=\"aviso\">El telefono no puede tener más de $tamTelefono caracteres.</p>\n";
    print "\n";
} else {
    $telefonosOk = true;
}

if (mb_strlen($email, "UTF-8") > $tamEmail) {
    print "      <p class=\"aviso\">El email no puede tener más de $tamEmail caracteres.</p>\n";
    print "\n";
} else {
    $emailOk = true;
}

if ($nombreOk && $apellidosOk && $telefonoOk && $emailOk) {
    if ($id == "") {
        print "      <p>No se ha seleccionado ningún registro.</p>\n";
    } elseif ($nombre == "" && $apellidos == "" && $telefono == "" && $email == "") {
        print "      <p>Hay que rellenar al menos uno de los campos. No se ha guardado la modificación.</p>\n";
    } else {
        $consulta = "SELECT COUNT(*) FROM $dbTabla
            WHERE id=:id";
        $result = $db->prepare($consulta);
        $result->execute(array(":id" => $id));
        if (!$result) {
            print "      <p>Error en la consulta.</p>\n";
        } elseif ($result->fetchColumn() == 0) {
            print "      <p>Registro no encontrado.</p>\n";
        } else {
            // La consulta cuenta los registros con un id diferente porque MySQL no distingue
            // mayúsculas de minúsculas y si en un registro sólo se cambian mayúsculas por
            // minúsculas MySQL diría que ya hay un registro como el que se quiere guardar.
            $consulta = "SELECT COUNT(*) FROM $dbTabla
                WHERE nombre=:nombre
                AND apellidos=:apellidos
                AND telefono=:telefono
                AND email=:email
                AND id<>:id";
            $result = $db->prepare($consulta);
            $result->execute(array(":nombre" => $nombre, ":apellidos" => $apellidos, ":telefono" => $telefono,
                ":email" => $email, ":id" => $id));
            if (!$result) {
                print "      <p>Error en la consulta.</p>\n";
            } elseif ($result->fetchColumn() > 0) {
                print "      <p>Ya existe un registro con esos mismos valores. "
                    . "No se ha guardado la modificación.</p>\n";
            } else {
                $consulta = "UPDATE $dbTabla
                    SET nombre=:nombre, apellidos=:apellidos, telefono=:telefono, email=:email
                    WHERE id=:id";
                $result = $db->prepare($consulta);
                if ($result->execute(array(":nombre" => $nombre,
                    ":apellidos" => $apellidos,
                    ":telefono" => $telefono,
                    ":email" => $email, ":id" => $id))) {
                    print "      <p>Registro modificado correctamente.</p>\n";
                } else {
                    print "      <p>Error al modificar el registro.</p>\n";
                }
            }
        }
    }
}

$db = null;
pie();
