<?php
// Bases de datos Biblioteca - insertar_2.php

require_once "biblioteca.php";

$db = conectaDb();
cabecera("Añadir 2", MENU_VOLVER);

$nombre      = recoge("nombre");
$apellidos   = recoge("apellidos");
$telefono    = recoge("telefono");
$email       = recoge("email");

$nombreOk    = false;
$apellidosOk = false;
$telefonoOk = false;
$emailOK = false;

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
    $telefonosOk = true;
}


if ($nombreOk && $apellidosOk) {
    if ($nombre == "" && $apellidos == "" && $telefono == "" && $email == "") {
        print "      <p>Hay que rellenar al menos uno de los campos. No se ha guardado el registro.</p>\n";
    } else {
        $consulta = "SELECT COUNT(*) FROM $dbTabla";
        $result = $db->query($consulta);
        if (!$result) {
            print "      <p>Error en la consulta.</p>\n";
        } elseif ($result->fetchColumn() >= MAX_REG_TABLA) {
            print "      <p>Se ha alcanzado el número máximo de registros que se pueden guardar.</p>\n";
            print "      <p>Por favor, borre algún registro antes.</p>\n";
        } else {
            $consulta = "SELECT COUNT(*) FROM $dbTabla
                WHERE nombre=:nombre
                AND apellidos=:apellidos";
            $result = $db->prepare($consulta);
            $result->execute(array(":nombre" => $nombre, ":apellidos" => $apellidos, ":telefono" => $telefono, ":email" => $email));
            if (!$result) {
                print "      <p>Error en la consulta.</p>\n";
            } elseif ($result->fetchColumn() > 0) {
                print "      <p>El registro ya existe.</p>\n";
            } else {
                $consulta = "INSERT INTO $dbTabla
                    (nombre, apellidos)
                    VALUES (:nombre, :apellidos)";
                $result = $db->prepare($consulta);
                if ($result->execute(array(":nombre" => $nombre, ":apellidos" => $apellidos, ":telefono" => $telefono, ":email" => $email))) {
                    print "      <p>Registro <strong>$nombre $apellidos $telefono $email</strong> creado correctamente.</p>\n";
                } else {
                    print "      <p>Error al crear el registro <strong>$nombre $apellidos $telefono $email</strong>.</p>\n";
                }
            }
        }
    }
}

$db = null;
pie();
