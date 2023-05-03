CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin VARCHAR NOT NULL,
    destination VARCHAR NOT NULL,
    duration INTEGER NOT NULL
);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('New York', 'London', 415);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('Shanghai', 'Paris', 760);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('Istanbul', 'Tokyo', 700);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('New York', 'Paris', 435);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('Moscow', 'Paris', 435);


INSERT INTO flights
    (origin, destination, duration)
    VALUES ('Lima', 'New York', 455);


SELECT * FROM flights;

SELECT * FROM flights WHERE id = 3;

SELECT * FROM flights WHERE origin='New York';

SELECT * FROM flights WHERE duration > 500;

SELECT * FROM flights WHERE destination = 'Paris' AND duration > 500;

SELECT * FROM flights WHERE destination = 'Paris' OR duration > 500;

SELECT destination, duration FROM flights;

SELECT AVG(duration) FROM flights WHERE origin = 'New York';

SELECT COUNT(*) FROM flights;

SELECT COUNT(*) FROM flights WHERE origin = 'New York';
SELECT COUNT(*) FROM flights WHERE origin = 'Moscow';

SELECT MIN(duration) FROM flights;

SELECT * FROM flights WHERE origin IN ('New York', 'Lima');

SELECT * FROM flights WHERE origin LIKE '%a%';



UPDATE flights
    SET duration = 430
    WHERE origin = 'New York'
    AND destination = 'London';



DELETE FROM flights WHERE destination = 'Tokyo';

SELECT * FROM flights LIMIT 2;

SELECT * FROM flights ORDER BY duration ASC;

SELECT * FROM flights ORDER BY duration DESC;

SELECT * FROM flights ORDER BY duration ASC LIMIT 2;

SELECT destination, COUNT(*) FROM flights GROUP BY destination;

SELECT destination, COUNT(*) FROM flights GROUP BY destination HAVING COUNT(*) > 1;

CREATE TABLE passengers(
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);

INSERT INTO passengers (name, flight_id) VALUES ('Alice', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Bob', 1);
INSERT INTO passengers (name, flight_id) VALUES ('Charlie', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Dave', 2);
INSERT INTO passengers (name, flight_id) VALUES ('Erin', 6);
INSERT INTO passengers (name, flight_id) VALUES ('Frank', 5);
INSERT INTO passengers (name, flight_id) VALUES ('Grace', 5);

SELECT origin, destination, name FROM flights JOIN passengers ON flights.id = passengers.flight_id;

SELECT origin, destination, name FROM flights JOIN passengers ON 
flights.id = passengers.flight_id
WHERE name = 'Alice';

SELECT origin, destination, name FROM flights LEFT JOIN passengers ON flights.id = passengers.flight_id;

SELECT origin, destination, name FROM flights RIGHT JOIN passengers ON flights.id = passengers.flight_id;

SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1;

SELECT * FROM flights WHERE id IN (SELECT flight_id FROM passengers GROUP BY flight_id HAVING COUNT(*) > 1);


