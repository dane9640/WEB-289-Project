<?php
$servername = "localhost";
$username = "";
$password = "";
$dbname = "";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

//Query to fetch data from a table, for example, `members`
$sql = "SELECT * FROM Member";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>";
    // Output header row from keys
    $first_row = $result->fetch_assoc();
    echo "<tr>";
    foreach($first_row as $key => $field) {
        echo "<th>" . htmlspecialchars($key) . "</th>";
    }
    echo "</tr>";
    // Output first row
    echo "<tr>";
    foreach($first_row as $field) {
        echo "<td>" . htmlspecialchars($field) . "</td>";
    }
    echo "</tr>";
    // Output remaining rows
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach($row as $field) {
            echo "<td>" . htmlspecialchars($field) . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
} else {
  echo "0 results";
}

echo "</br>";

$sql = "SELECT * FROM Recipe";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'>";
    // Output header row from keys
    $first_row = $result->fetch_assoc();
    echo "<tr>";
    foreach($first_row as $key => $field) {
        echo "<th>" . htmlspecialchars($key) . "</th>";
    }
    echo "</tr>";
    // Output first row
    echo "<tr>";
    foreach($first_row as $field) {
        echo "<td>" . htmlspecialchars($field) . "</td>";
    }
    echo "</tr>";
    // Output remaining rows
    while($row = $result->fetch_assoc()) {
        echo "<tr>";
        foreach($row as $field) {
            echo "<td>" . htmlspecialchars($field) . "</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
} else {
  echo "0 results";
}

$conn->close();
?>
