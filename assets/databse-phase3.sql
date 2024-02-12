-- Database Reset
DROP DATABASE IF EXISTS shareaplate;

-- Create the database
CREATE DATABASE shareaplate;
USE shareaplate;

-- Create table for Members
CREATE TABLE Member (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL,
    member_level ENUM('member', 'admin', 'superadmin') NOT NULL
);

-- Create table for Ingredients
CREATE TABLE Ingredient (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(255) NOT NULL
);

-- Create table for Categories
CREATE TABLE Category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

-- Create table for Recipes
CREATE TABLE Recipe (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    meal_type SET('breakfast', 'lunch', 'dinner') NOT NULL,
    description CHAR(255),
    prep_time TEXT,
    cook_time TEXT,
    image_url VARCHAR(255),
    video_url VARCHAR(255),
    member_id INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id)
);

-- Create table for Recipe_Ingredient (Join Table)
CREATE TABLE Recipe_Ingredient (
    recipe_ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_id INT,
    recipe_id INT,
    quantity INT,
    unit SET('cup', 'oz', 'tbs', 'lbs', 'g', 'kg', 'ml', 'l', 'teaspoon', 'pinch', 'quart', 'pint', 'gallon', 'slice', 'piece', 'dash', 'drop', 'handful', 'stick'),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(ingredient_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-- Create table for Recipe_Category (Join Table)
CREATE TABLE Recipe_Category (
    recipe_category_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_id INT,
    category_id INT,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Create table for Ratings
CREATE TABLE Rating (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    recipe_id INT,
    score INT,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (recipe_id) REFERENCES Recipe(recipe_id)
);

-----------------------
-----------------------
-- Dummy Insert Data --
-----------------------
-----------------------

USE shareaplate;

-- Inserting dummy data into Members
INSERT INTO Member (first_name, last_name, username, password, email, member_level) VALUES
('John', 'Doe', 'johndoe', 'password123', 'johndoe@example.com', 'member'),
('Jane', 'Smith', 'janesmith', 'password123', 'janesmith@example.com', 'admin'),
('Bob', 'Brown', 'bobbrown', 'password123', 'bobbrown@example.com', 'superadmin');

-- Inserting dummy data into Ingredients
INSERT INTO Ingredient (ingredient_name) VALUES
('Flour'),
('Sugar'),
('Eggs'),
('Milk'),
('Baking Powder');

-- Inserting dummy data into Categories
INSERT INTO Category (category_name) VALUES
('Dessert'),
('Main Course'),
('Appetizer'),
('Vegan'),
('Gluten Free');

-- Inserting dummy data into Recipes
INSERT INTO Recipe (title, meal_type, description, prep_time, cook_time, image_url, video_url, member_id) VALUES
('Chocolate Cake', 'dessert', 'Delicious and rich chocolate cake', '15 min', '45 min', 'http://example.com/chococake.jpg', 'http://example.com/chococake.mp4', 1),
('Vegan Curry', 'dinner', 'A spicy and hearty vegan curry', '20 min', '60 min', 'http://example.com/vegancurry.jpg', 'http://example.com/vegancurry.mp4', 2);

-- Inserting dummy data into Recipe_Ingredient
INSERT INTO Recipe_Ingredient (ingredient_id, recipe_id, quantity, unit) VALUES
(1, 1, 200, 'g'),
(2, 1, 100, 'g'),
(3, 1, 3, 'piece'),
(4, 2, 200, 'ml'),
(1, 2, 150, 'g');

-- Inserting dummy data into Recipe_Category
INSERT INTO Recipe_Category (recipe_id, category_id) VALUES
(1, 1),
(2, 4);

-- Inserting dummy data into Ratings
INSERT INTO Rating (member_id, recipe_id, score) VALUES
(1, 1, 5),
(2, 1, 4),
(3, 2, 5),
(1, 2, 4);
