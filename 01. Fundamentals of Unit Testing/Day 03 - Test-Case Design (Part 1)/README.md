# Test Case Design: Basics

## Overview

When designing test cases, the goal is to ensure that your tests are effective, easy to manage, and provide useful feedback on the quality of the software. The following principles can guide you in creating effective test cases.

## 1. Covering a Variety of Scenarios

Test cases should cover a wide range of scenarios to ensure the software behaves correctly in different situations. This includes:

- **Typical cases**: Common or standard use cases
- **Edge cases**: Boundary conditions or unusual inputs
- **Error cases**: Situations where the system is expected to fail gracefully

**Example**:  
If you're testing a login form:
- A **typical case** might be a valid username and password.
- An **edge case** might be an empty password field or a password that is too long.
- An **error case** might involve an incorrect username and password combination.

## 2. Simplicity

Each test case should be clear, concise, and simple. Avoid over-complicating a test case by including too many conditions or steps in a single test. This makes it easier to understand, execute, and debug if necessary. Simplicity also helps to reduce errors during test execution.

**Example**:  
Instead of testing multiple variables in one test case, break it down into smaller, simpler tests for each variable.

## 3. Repeatability

A good test case must be repeatable. This means that it should yield the same results each time it is executed, regardless of the environment or when it is executed. Ensure that the test case doesn’t rely on external variables or states that can change.

**Example**:  
Ensure that any necessary test data is consistent and set up in the same way for each run.

## 4. Independence

Each test case should be independent of others. If a test case depends on the outcome of another, it creates unnecessary complexity and can lead to unreliable results. You should be able to execute test cases in any order without them interfering with one another.

**Example**:  
- Test Case 1: Verifying login with a valid username and password.
- Test Case 2: Verifying login with a blank password.  
These should be independent of each other, meaning you can run them in any order.

## Key Steps in Identifying Inputs and Expected Outputs

### Identify Inputs:
- Understand the functionality you're testing and list the different inputs that the system might encounter. This could include user inputs, API parameters, or environmental factors.
- Inputs can be valid or invalid, boundary values, and extreme cases.

### Define Expected Outputs:
- For each input, define the expected outcome. This could be a success message, an error message, or a system state change.
- The expected result should align with the requirements and specifications of the software.

# Sample Code Outline (C++ with SQLite)

## Step 1: Install SQLite3

Download and set up SQLite3 (or use the version included in your IDE if available).

## Step 2: C++ Code for Authentication

```cpp
#include <iostream>
#include <sqlite3.h>
#include <string>

using namespace std;

// Function to check credentials
bool validateCredentials(const string& username, const string& password) {
    sqlite3* db;
    sqlite3_stmt* stmt;
    const char* dbPath = "users.db";  // Path to the database file

    // Open the SQLite database
    if (sqlite3_open(dbPath, &db) != SQLITE_OK) {
        cerr << "Error opening database: " << sqlite3_errmsg(db) << endl;
        return false;
    }

    // SQL query to check if username and password match
    string query = "SELECT * FROM users WHERE username = ? AND password = ?";

    // Prepare the SQL statement
    if (sqlite3_prepare_v2(db, query.c_str(), -1, &stmt, 0) != SQLITE_OK) {
        cerr << "Error preparing statement: " << sqlite3_errmsg(db) << endl;
        sqlite3_close(db);
        return false;
    }

    // Bind the username and password parameters
    sqlite3_bind_text(stmt, 1, username.c_str(), -1, SQLITE_STATIC);
    sqlite3_bind_text(stmt, 2, password.c_str(), -1, SQLITE_STATIC);

    // Execute the query and check the result
    int result = sqlite3_step(stmt);
    if (result == SQLITE_ROW) {
        // Valid credentials
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return true;
    } else {
        // Invalid credentials
        sqlite3_finalize(stmt);
        sqlite3_close(db);
        return false;
    }
}

int main() {
    string username, password;

    // User input for credentials
    cout << "Enter Username: ";
    cin >> username;
    cout << "Enter Password: ";
    cin >> password;

    // Validate credentials
    if (validateCredentials(username, password)) {
        cout << "Login Successful!" << endl;
    } else {
        cout << "Invalid username or password." << endl;
    }

    return 0;
}
```
## Step 3: SQLite Database Setup for C++ Authentication

You can create the SQLite database and table using a SQLite client (like the command-line interface or a GUI tool like DB Browser for SQLite). Here are the commands to execute in SQLite to create the `users.db` database and a `users` table.

### Using SQLite command-line interface:

1. Open your command-line terminal.
2. Enter SQLite command-line by typing `sqlite3`:

    ```bash
    sqlite3 users.db
    ```

3. Create the `users` table with columns for username and password:

    ```sql
    CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        password TEXT NOT NULL
    );
    ```

4. Insert some sample data for testing:

    ```sql
    INSERT INTO users (username, password) VALUES ('user1', 'password1');
    INSERT INTO users (username, password) VALUES ('user2', 'password2');
    INSERT INTO users (username, password) VALUES ('user3', 'password3');
    ```

5. Once done, exit the SQLite shell:

    ```bash
    .quit
    ```

Now, the `users.db` database is created with the `users` table containing sample data.

### Verify Database Structure

You can check the structure of the table by opening the SQLite command-line interface again and running:

```bash
sqlite3 users.db
```
## Step 4: Running the code 
```bash
g++ main.cpp -o output -lsqlite3
```

# Writing Unit Test Cases