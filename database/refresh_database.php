<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "kitsakit";

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Create connection
$conn = new mysqli($servername, $username, $password);

$createDatabaseQuery = "CREATE DATABASE IF NOT EXISTS $database";
if ($conn->query($createDatabaseQuery) === TRUE) {
    echo "Database created successfully or already exists.";
} else {
    echo "Error creating database: " . $conn->error;
    exit;
}

// Select database
$conn->select_db($database);

$sqlFile = 'kitsakit.sql';

// Read SQL file content
$sql = file_get_contents($sqlFile);

// Execute multi query
if ($conn->multi_query($sql) === TRUE) {
    echo "SQL executed successfully. Table already exists.";
} else {
    echo "Error executing SQL: " . $conn->error;
}

// Close connection
$conn->close();