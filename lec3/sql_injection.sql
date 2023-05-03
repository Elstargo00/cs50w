SELECT * FROM users
WHERE username = "harry" AND password = "12345"



-- Injection
SELECT * FROM users
WHERE username = "hacker";--" AND password = "";