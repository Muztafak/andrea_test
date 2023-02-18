<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$connection = new mysqli("mysql-db", "root", "password", "MITIENDITA");

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}
$result = $connection->query("SELECT empleados.*, checador.*
                                    FROM empleados INNER JOIN checador
                                    ON empleados.id = checador.empleado_id;");

$jsonResult = array();

while ($row = $result->fetch_assoc()) {
    $jsonResult[] = $row;
}

echo json_encode($jsonResult);
echo "<br/><br/><br/>";
echo "[";
foreach ($jsonResult as $row) {
    echo "<br/>&ensp;{<br/>";
    foreach ($row as $key => $value) {
        echo "&ensp;&ensp;${key}: ${value} <br/>";
    }
    echo "&ensp;},";
}
echo "<br/>]";
?>