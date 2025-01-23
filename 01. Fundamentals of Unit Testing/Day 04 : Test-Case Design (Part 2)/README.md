# Edge Cases and Error Handling

These are the testcases of the Authentication_project in Day 03.
Here we will see the different possible testcases for the username and password.
The program handles a variety of typical and edge cases to ensure robustness. These include:

## 1. Valid Credentials (Typical Case)
- **Test case**: `username = "user1"`, `password = "password1"`
- **Expected output**: `Login Successful!`

## 2. Invalid Username (Edge Case)
- **Test case**: `username = "nonexistent_user"`, `password = "password1"`
- **Expected output**: `Invalid username or password.`

## 3. Invalid Password (Edge Case)
- **Test case**: `username = "user2"`, `password = "wrong_password"`
- **Expected output**: `Invalid username or password.`

## 4. Empty Username (Edge Case)
- **Test case**: `username = ""`, `password = "password1"`
- **Expected output**: `Invalid username or password.`

## 5. Empty Password (Edge Case)
- **Test case**: `username = "user1"`, `password = ""`
- **Expected output**: `Invalid username or password.`

## 6. Whitespace in Username (Edge Case)
- **Test case**: `username = " user1 "`, `password = "password1"`
- **Expected output**: `Invalid username or password.`  
  *(Handling depends on how the database stores the username).*

## 7. Whitespace in Password (Edge Case)
- **Test case**: `username = "user1"`, `password = " password1 "`
- **Expected output**: `Invalid username or password.`  
  *(Handling depends on how the database stores the password).*

## 8. SQL Injection Attempt (Security Case)
- **Test case**: `username = "user1"`, `password = "' OR 1=1 --"`
- **Expected output**: `Invalid username or password.`  
  *(SQL injection is prevented).*

## 9. Maximum Length Username and Password (Boundary Case)
- **Test case**: `username = "a" * 255`, `password = "b" * 255`
- **Expected output**: `Login Successful!`  
  *(Assuming the database accepts these lengths).*

## 10. Null Input (Edge Case)
- **Test case**: `username = NULL`, `password = NULL`
- **Expected output**: `Invalid username or password.`  
  *(If handled as null or empty).*

## 11. Username Case Sensitivity (Boundary Case)
- **Test case**: `username = "USER1"`, `password = "password1"`
- **Expected output**: `Invalid username or password.`  
  *(If the system is case-sensitive).*

## 12. Database Connection Failure (Edge Case)
- **Test case**: Any valid username and password input.
- **Expected output**: `Error opening database: <SQLite error message>`  
  *(If the database connection fails).*

## 13. Empty Database (Edge Case)
- **Test case**: Any valid username and password input when the database is empty.
- **Expected output**: `Invalid username or password.`  
  *(If no records exist in the database).*

## 14. Special Characters in Username or Password (Boundary Case)
- **Test case**: `username = "special!user"`, `password = "pa$$word"`
- **Expected output**: `Login Successful!`  
  *(If special characters are handled correctly).*
