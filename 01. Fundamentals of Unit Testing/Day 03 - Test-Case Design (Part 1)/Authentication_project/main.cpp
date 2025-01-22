#include "main.hpp"
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
