CREATE DATABASE pathfinder;
CREATE DATABASE eve_universe;
CREATE DATABASE seat;

GRANT ALL PRIVILEGES ON pathfinder.* TO 'seat'@'localhost';
GRANT ALL PRIVILEGES ON eve_universe.* TO 'seat'@'localhost';
GRANT ALL PRIVILEGES ON seat.* TO 'seat'@'localhost';