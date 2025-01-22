#ifndef AUTHENTICATION_H
#define AUTHENTICATION_H

#include <iostream>
#include <sqlite3.h>
#include <string>

// Function to check credentials
bool validateCredentials(const std::string& username, const std::string& password);

#endif // AUTHENTICATION_H

