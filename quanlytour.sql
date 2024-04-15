CREATE SCHEMA `quanlytour` ;
use `quanlytour`;
CREATE TABLE `quanlytour`.`categorytour` (
  `id` INT NOT NULL,
  `categoryCode` VARCHAR(255) NULL,
  `categoryName` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `quanlytour`.`destination` (
  `id` INT NOT NULL,
  `destinationName` VARCHAR(255) NULL,
  `describe` VARCHAR(255) NULL,
  `cost` INT NULL,
  `city_id` INT NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `quanlytour`.`tour` (
  `id` INT NOT NULL,
  `tourCode` VARCHAR(255) NULL,
  `category_id` INT NULL,
  `destination_id` INT NULL,
  `dateStart` DATE NULL,
  `dateEnd` DATE NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `quanlytour`.`ordertour` (
  `id` INT NOT NULL,
  `tour_id` INT NULL,
  `client_id` INT NULL,
  `statuss` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `quanlytour`.`clients` (
  `id` INT NOT NULL,
  `nameClients` VARCHAR(255) NULL,
  `idNumber` VARCHAR(255) NULL,
  `dateBirth` DATE NULL,
  `city_id` INT NULL,
  PRIMARY KEY (`id`));
  CREATE TABLE `quanlytour`.`city` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NULL,
  PRIMARY KEY (`id`));
  
  ALTER TABLE `quanlytour`.`tour` 
ADD CONSTRAINT `fk_categoryidTour_idTour`
  FOREIGN KEY (`category_id`)
  REFERENCES `quanlytour`.`categorytour` (`id`);
  
  ALTER TABLE `quanlytour`.`tour` 
ADD CONSTRAINT `fk_destinationidTour_idDestination`
  FOREIGN KEY (`destination_id`)
  REFERENCES `quanlytour`.`destination` (`id`);
  
ALTER TABLE `quanlytour`.`destination` 
ADD CONSTRAINT `fk_cityidDestination_idCity`
  FOREIGN KEY (`city_id`)
  REFERENCES `quanlytour`.`city` (`id`);
  
ALTER TABLE `quanlytour`.`ordertour` 
ADD CONSTRAINT `fk_touridOdertour_idTour`
  FOREIGN KEY (`tour_id`)
  REFERENCES `quanlytour`.`tour` (`id`);
ALTER TABLE `quanlytour`.`ordertour`
ADD CONSTRAINT `fk_clientidOdertour_idClient`
  FOREIGN KEY (`client_id`)
  REFERENCES `quanlytour`.`clients` (`id`);
 ALTER TABLE `quanlytour`.`clients` 
ADD CONSTRAINT `fk_cityidClient1_idCity`
  FOREIGN KEY (`city_id`)
  REFERENCES `quanlytour`.`city` (`id`);
  
  -- Them 5 thanh pho
  INSERT INTO `city` (`id`,`name`) VALUES (1,'Hue');
  INSERT INTO `city` (`id`,`name`) VALUES (2,'Ha Noi');
  INSERT INTO `city` (`id`,`name`) VALUES (3,'Da Nang');
  INSERT INTO `city` (`id`,`name`) VALUES (4,'Sai gon');
  INSERT INTO `city` (`id`,`name`) VALUES (5,'Da Lat');
  
  -- Them 5 diem den du lich
  INSERT INTO `quanlytour`.`destination` (`id`, `destinationName`, `describe`, `cost`, `city_id`) VALUES ('1', 'Thanh Pho Hue', 'Dai Noi, Cho Dong Ba, Lang tam,...', '2000', '1');
  INSERT INTO `quanlytour`.`destination` (`id`, `destinationName`, `describe`, `cost`, `city_id`) VALUES ('2', 'Thanh Pho Ha Noi', 'Ho Guom, Lang Bac, Pho co,...', '5000', '2');
  INSERT INTO `quanlytour`.`destination` (`id`, `destinationName`, `describe`, `cost`, `city_id`) VALUES ('3', 'Thanh Pho Da Nang', 'BanaHill, Cau Rong, AsiaPark ', '6000', '3');
  INSERT INTO `quanlytour`.`destination` (`id`, `destinationName`, `describe`, `cost`, `city_id`) VALUES ('4', 'Thanh Pho Ho Chi Minh', 'Buu Dien, Dinh Doc Lap, Lanmark 81', '4000', '4');
  INSERT INTO `quanlytour`.`destination` (`id`, `destinationName`, `describe`, `cost`, `city_id`) VALUES ('5', 'Thanh Pho Da Lat', 'Thung lung tinh yeu, Cho dem Da Lat, Quang truong', '3500', '5');
  
  -- them 10 khach hang
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('1', 'Quang', '012024', '1995-12-12', '1');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('2', 'Dung', '022024', '1993-06-25', '3');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('3', 'Duong', '032024', '1995-05-06', '4');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('4', 'Hoang', '042024', '1992-10-03', '1');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('5', 'Phuong', '052024', '1996-11-12', '2');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('6', 'Thanh', '062024', '2000-02-18', '3');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('7', 'Nga', '072024', '2003-01-30', '2');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('8', 'Nguyet', '082024', '1987-08-28', '5');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('9', 'Trung', '092024', '1970-03-22', '4');
  INSERT INTO `quanlytour`.`clients` (`id`, `nameClients`, `idNumber`, `dateBirth`, `city_id`) VALUES ('10', 'Phong', '102024', '1994-09-21', '5');
  
  -- them 2 loai tour
INSERT INTO `quanlytour`.`categorytour` (`id`, `categoryCode`, `categoryName`) VALUES ('1', '3d', 'Tour 3 day');
INSERT INTO `quanlytour`.`categorytour` (`id`, `categoryCode`, `categoryName`) VALUES ('2', '5d', 'Tour 5 day');

-- them 15 tour
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('1', 'HUE3d', '1', '1', '2024-05-15', '2024-05-18');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('2', 'HUE5d', '2', '1', '2024-05-12', '2024-05-17');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('3', 'DN3d', '1', '3', '2024-05-11', '2024-05-14');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('4', 'DN5d', '2', '3', '2024-05-05', '2024-05-10');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('5', 'HN3d', '1', '2', '2024-04-29', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('6', 'HN5d', '2', '2', '2024-04-27', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('7', 'SG3d', '1', '4', '2024-04-29', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('8', 'SG5d', '2', '4', '2024-04-27', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('9', 'DL3d', '1', '5', '2024-04-29', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('10', 'DL5d', '2', '5', '2024-04-27', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('11', 'HUE3ds', '1', '1', '2024-04-29', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('12', 'HUE5ds', '2', '1', '2024-04-27', '2024-05-01');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('13', 'DN5ds', '2', '3', '2024-05-03', '2024-05-08');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('14', 'DL3s', '1', '5', '2024-04-20', '2024-04-23');
INSERT INTO `quanlytour`.`tour` (`id`, `tourCode`, `category_id`, `destination_id`, `dateStart`, `dateEnd`) VALUES ('15', 'HN3s', '1', '2', '2024-04-20', '2024-04-23');

-- them 10 don dat tour
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('1', '1', '1', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('2', '2', '2', 'paid');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('3', '3', '3', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('4', '4', '4', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('5', '5', '5', 'paid');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('6', '6', '6', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('7', '7', '7', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('8', '8', '8', 'paid');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('9', '9', '9', 'paid half');
INSERT INTO `quanlytour`.`ordertour` (`id`, `tour_id`, `client_id`, `statuss`) VALUES ('10', '10', '10', 'paid');

-- Thong ke so luong tuor cua cac thanh pho
select c.name AS CityName, count(t.id) AS NumberOfTours
from City c
         join destination d on c.id = d.city_id
         join tour t on d.id = t.destination_id
group by c.name ;
  -- tinh so tour bat dau trong thang 4
  select  count(dateStart) as TourStarIn_4Month from tour  where month(dateStart) = '4' ;
  
  -- tinh so tour ket thuc trong thang 5
  select count(dateEnd) as TourEndIn_5Month from tour where month(dateEnd) = '5';
  