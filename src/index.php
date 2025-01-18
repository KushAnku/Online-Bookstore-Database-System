<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ankush Singh's SQL Interface</title>
</head>
<body>
    <h1>Ankush Singh's SQL Interface</h1>
    <form method="POST" action="index.php">
        <label for="query">Enter SQL Query (Single or Multiple Queries):</label><br>
        <textarea name="query" id="query" rows="15" cols="100"><?php if (isset($_POST['query'])) echo htmlspecialchars($_POST['query']); ?></textarea><br><br>
        <button type="submit">Execute Query</button>
        <button type="button" onclick="document.getElementById('query').value = '';">Clear</button>
    </form>

    <h2>Query Result:</h2>
    <?php
    // Enable error reporting
    ini_set('display_errors', 1);
    error_reporting(E_ALL);

    // Database credentials
    $servername = "sysmysql8.auburn.edu";
    $username = "-------";
    $password = "--------"; // Update with your actual password
    $dbname = "--------";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        die("<p style='color:red;'>Connection failed: " . $conn->connect_error . "</p>");
    }

    // Handle query submission
    if ($_SERVER["REQUEST_METHOD"] == "POST" && !empty($_POST['query'])) {
        $query = $_POST['query']; // Get query from form input
        $query = trim($query); // Remove leading/trailing whitespace
        $query = str_replace("\\'", "'", $query); // Fix over-escaped single quotes

        // Execute multiple queries
        if ($conn->multi_query($query)) {
            do {
                $result = $conn->store_result(); // Store the result of the current query
                if ($result) {
                    // Display the result in a table
                    echo "<table border='1'><tr>";
                    while ($field = $result->fetch_field()) {
                        echo "<th>" . htmlspecialchars($field->name) . "</th>";
                    }
                    echo "</tr>";
                    while ($row = $result->fetch_assoc()) {
                        echo "<tr>";
                        foreach ($row as $value) {
                            echo "<td>" . htmlspecialchars($value) . "</td>";
                        }
                        echo "</tr>";
                    }
                    echo "</table><br>";
                    $result->free(); // Free the result set
                } else {
                    // Check if no result or an error occurred
                    if ($conn->errno) {
                        echo "<p style='color:red;'>SQL Error: " . $conn->error . "</p>";
                    }
                }
            } while ($conn->next_result()); // Move to the next result
        } else {
            echo "<p style='color:red;'>SQL Error: " . $conn->error . "</p>";
        }
    }

    // Close the connection
    $conn->close();
    ?>
</body>
</html>

