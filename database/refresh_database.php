<?php
$servername = "localhost";
$username = "root";
$password = "";

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create connection
$conn = new mysqli($servername, $username, $password);

$sqlFile = 'db_rumah_sakit.sql';

// Read SQL file content
$sql = file_get_contents($sqlFile);

// Execute multi query
if ($conn->multi_query($sql) == TRUE) {
    echo "SQL executed successfully. Database is made.";
} else {
    echo "Error executing SQL: " . $conn->error;
}

// Close connection
$conn->close();