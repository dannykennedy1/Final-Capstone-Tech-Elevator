USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE final_capstone
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

--create tables
CREATE TABLE users (
	user_id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	salt varchar(200) NOT NULL,
	user_role varchar(50) NOT NULL,
)

CREATE TABLE breweries (
	brewery_id int IDENTITY(100,1) PRIMARY KEY NOT NULL,
	name varchar(50) NOT NULL,
	street_address varchar(50) NOT NULL,
	city varchar(50) NOT NULL,
	state varchar(2) NOT NULL,
	zip varchar(5) NOT NULL,
	phone varchar (20),
	email varchar (50),
	website varchar (50),
	map_link varchar(200),
	description varchar(450),
	category varchar (100),
	logo varchar(450),
	photo varchar(450),
)

CREATE TABLE beers(
	beer_id int IDENTITY(200,1) PRIMARY KEY NOT NULL,
	name varchar(50),
	description varchar(250), 
	type varchar(50),
	abv varchar(10),
	brewery_id int,
)

CREATE TABLE reviews(
review_id int IDENTITY (300,1) PRIMARY KEY NOT NULL,
title varchar(50),
description varchar(200),
rating int CHECK(rating <= 5),
beer_id int,
)

--insert default data
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('user','Jg45HuwT7PZkfuKTz6IB90CtWY4=','LHxP4Xh7bN0=','user')
INSERT INTO users (username, password_hash, salt, user_role) VALUES ('admin','YhyGVQ+Ch69n4JMBncM4lNF/i9s=', 'Ar/aB2thQTI=','admin')

INSERT INTO breweries (name, street_address, city, state, zip, phone, email, website, description, photo, category, logo)
	VALUES(
		'Yellow Springs Brewery',
		'2855 Indianola Ave',
		'Clintonville',
		'OH',
		'43202',
		'(614)-261-7128',
		'brew@yellowspringsbrewery.com',
		'https://www.yellowspringsbrewery.com',
		'At Yellow Springs Brewery, we brew exceptional beer every day in every batch. Founded in 2013, today we produce multiple core and packaged brands along with dozens of innovative seasonal beers. They can be found in restaurants and pubs in the Dayton and Columbus areas and in our tap room in Yellow Springs.',
		'https://breakfastwithnick.com/wp-content/uploads/yellow-springs-brewery-columbus-14.jpeg',
		'Brewpub',
		'https://images.squarespace-cdn.com/content/v1/65410d79866d2b6c0256f373/4ec291e9-a251-4413-8796-008bcdce9524/Yellow-Springs-Brewery-Logo-Full-Color.png'
	)

INSERT INTO breweries(name, street_address, city, state, zip, phone,email, website, description, photo, category, logo)
	VALUES(
		'Crooked Can Brewing Company',
		'5354 Center St',
		'Hilliard',
		'OH',
		'43026',
		'(614)-219-1500',
		'info@crookedcanohio.com',
		'https://crookedcanohio.com/',
		'At Crooked Can Brewing Company, experienced craftsmanship and science come together to brew deliciously memorable results. Our brewmasters are adept at blending old world techniques with cutting edge brewing practices for full-bodied, tastefully crisp beer. To us, fermentation is more than just a science. It�s a way of life! We look after all of our brews, carefully creating naturally cultured, refreshing beer.',
		'https://i.ytimg.com/vi/UH9Kf5X3brE/maxresdefault.jpg',
		'Bewpub',
		'https://crookedcanohio.com/bc/wp-content/uploads/crooked-can-full-label-logo.png'
	)

INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Juicy tropical fruit and citrus notes blaze through this fresh and hoppy American IPA.', 'Boat Show', 'IPA' ,'7.0', 100)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Light-bodied Saison with American Comet hops for a rustic, juicy citrus profile and a spicy yeast character, making it highly drinkable.', 'Captain Stardust', 'Saison ' ,'6.5', 100)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('An imperial stout brewed with crisp American 2-Row malt and plenty of chocolate and roasted barley.', 'Maxxdout Stout', 'Imperial Stout' ,'11.2', 100)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Dry stout with roasted barley imparts malty depth. Enjoy coffee and bittersweet chocolate notes, leading to a dry finish�perfect for any Ohio season!', 'Lost Echoes', 'Dry Stout' ,'5.2', 100)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Moderate-bodied Ale with chocolate and molasses notes, balanced by American hops for a bold, citrusy profile.', 'Handsome', 'Brown Ale' ,'5.5', 100)

INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Easy drinking. Citrus fruit hop flavor and aroma.', '3rd Rail Hazy Pale Ale', 'Pale Ale' ,'5.3', 101)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Sessionable IPA with citrus undertones.', 'Sayonara Summer', 'IPA' ,'4.1', 101)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Blonde ale infused with Prickly Pear. Portion of sales going to local Cancer Charities.', 'Nettie Ros� ', 'Blonde Ale' ,'4.2', 101)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Crisp summertime lager with a malty backbone and subtle rye spice.', 'Est 1852 Lager', 'Lager' ,'5.2', 101)
INSERT INTO beers (description, name, type, abv, brewery_id)  VALUES ('Malty lager brewed with pumpkin puree and spices.', 'Passive Pumpkin', 'Pumpkin' ,'5.4', 101)


INSERT INTO reviews (title, description, rating, beer_id)
VALUES ('Delightful Craft Beer', 'I absolutely loved the rich flavors of this craft beer. It had a perfect balance of hops and malt.', 5, 200);


INSERT INTO reviews (title, description, rating, beer_id)
VALUES ('Pleasant Surprise', 'This beer exceeded my expectations. The flavors were delightful, and it left a positive impression.', 4, 205);




--create constraints
ALTER TABLE [beers] WITH CHECK ADD CONSTRAINT [FK_brewery_beer]
FOREIGN KEY (brewery_id) REFERENCES [breweries] (brewery_id),
FOREIGN KEY (beer_id) REFERENCES [beers] (beer_id)

GO

