CREATE TABLE `user` (
  `user_id` INT PRIMARY KEY,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `user_type` VARCHAR('agent', 'renter') NOT NULL
);

CREATE TABLE `agent` (
  `agent_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `job_title` VARCHAR(255) NOT NULL,
  `real_estate_agency` VARCHAR(255) NOT NULL,
  `contact_info` VARCHAR(255) NOT NULL
);

CREATE TABLE `renter` (
  `renter_id` INT PRIMARY KEY,
  `user_id` INT NOT NULL,
  `move_in_date` DATE NOT NULL,
  `preferred_location` VARCHAR(255) NOT NULL,
  `budget` INT NOT NULL
);

CREATE TABLE `property` (
  `property_id` INT PRIMARY KEY,
  `type` VARCHAR(255) NOT NULL,
  `city` VARCHAR(255) NOT NULL,
  `state` VARCHAR(255),
  `location` VARCHAR(255) NOT NULL,
  `description` TEXT NOT NULL,
  `price` DECIMAL(10, 2) NOT NULL,
  `availability` BOOLEAN NOT NULL
);

CREATE TABLE `House` (
  `property_id` INT PRIMARY KEY,
  `number_of_rooms` INT NOT NULL,
  `square_footage_area` INT NOT NULL,
  `rental_price` INT NOT NULL
);

CREATE TABLE `Apartment` (
  `property_id` INT PRIMARY KEY,
  `number_of_rooms` INT NOT NULL,
  `square_footage_area` INT NOT NULL,
  `building_type` VARCHAR(255) NOT NULL,
  `rental_price` INT NOT NULL
);

CREATE TABLE `Commercial_building` (
  `property_id` INT PRIMARY KEY,
  `square_footage_area` INT NOT NULL,
  `business_type` VARCHAR(255) NOT NULL,
  `rental_price` INT NOT NULL
);

CREATE TABLE `property_booking` (
  `booking_id` INT PRIMARY KEY,
  `property_id` INT NOT NULL,
  `renter_id` INT NOT NULL,
  `credit_card_id` INT NOT NULL,
  `booking_date` DATE NOT NULL
);

CREATE TABLE `credit_card` (
  `credit_card_id` INT PRIMARY KEY,
  `renter_id` INT NOT NULL,
  `payment_address` VARCHAR(255) NOT NULL,
  `card_number` VARCHAR(16) NOT NULL,
  `card_expiry_date` DATE NOT NULL
);

ALTER TABLE `user` ADD FOREIGN KEY (`user_id`) REFERENCES `renter` (`user_id`);

ALTER TABLE `user` ADD FOREIGN KEY (`user_id`) REFERENCES `agent` (`user_id`);

ALTER TABLE `renter` ADD FOREIGN KEY (`renter_id`) REFERENCES `credit_card` (`renter_id`);

ALTER TABLE `renter` ADD FOREIGN KEY (`renter_id`) REFERENCES `property_booking` (`renter_id`);

ALTER TABLE `property` ADD FOREIGN KEY (`property_id`) REFERENCES `property_booking` (`property_id`);

ALTER TABLE `property` ADD FOREIGN KEY (`property_id`) REFERENCES `House` (`property_id`);

ALTER TABLE `property` ADD FOREIGN KEY (`property_id`) REFERENCES `Apartment` (`property_id`);

ALTER TABLE `property` ADD FOREIGN KEY (`property_id`) REFERENCES `Commercial_building` (`property_id`);
