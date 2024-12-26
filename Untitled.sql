CREATE DATABASE meal_db;

USE meal_db;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    dietary_preference VARCHAR(50),
    health_conditions VARCHAR(255)
);

CREATE TABLE Meals (
    meal_id INT AUTO_INCREMENT PRIMARY KEY,
    meal_name VARCHAR(100) NOT NULL,
    dietary_preference VARCHAR(50),
    health_conditions VARCHAR(255),
    calories INT
);


INSERT INTO Meals (meal_name, dietary_preference, health_conditions, calories, protein, fat, carbohydrates, meal_category)
VALUES 
-- Non-Vegetarian Meals with Various Health Conditions
('Grilled Chicken Salad', 'Non-Vegetarian', NULL, 300, 30, 10, 20, 'Lunch'),
('BBQ Chicken Wrap', 'Non-Vegetarian', 'Diabetes', 450, 35, 15, 40, 'Lunch'),
('Salmon and Avocado Bowl', 'Non-Vegetarian', 'Heart Disease', 500, 40, 20, 30, 'Dinner'),
('Turkey Sandwich', 'Non-Vegetarian', 'Hypertension', 350, 25, 10, 40, 'Lunch'),
('Lamb Kebab', 'Non-Vegetarian', 'Celiac', 400, 30, 15, 25, 'Dinner'),

-- Vegetarian Meals with Various Health Conditions
('Vegetable Stir Fry', 'Vegetarian', 'Diabetes', 200, 10, 5, 30, 'Dinner'),
('Paneer Tikka', 'Vegetarian', 'Heart Disease', 350, 20, 15, 25, 'Lunch'),
('Spinach and Mushroom Pasta', 'Vegetarian', 'Hypertension', 400, 15, 10, 50, 'Dinner'),
('Chickpea Salad', 'Vegetarian', 'Celiac', 300, 15, 10, 35, 'Lunch'),
('Vegetable Biryani', 'Vegetarian', NULL, 400, 10, 10, 60, 'Dinner'),

-- Vegan Meals with Various Health Conditions
('Avocado Toast', 'Vegan', NULL, 250, 5, 15, 30, 'Breakfast'),
('Quinoa Salad', 'Vegan', 'Diabetes', 200, 8, 5, 35, 'Lunch'),
('Vegan Lentil Soup', 'Vegan', 'Heart Disease', 300, 15, 5, 40, 'Dinner'),
('Vegan Burrito Bowl', 'Vegan', 'Celiac', 350, 12, 10, 50, 'Lunch'),
('Tofu Stir Fry', 'Vegan', 'Hypertension', 220, 15, 8, 20, 'Dinner'),

-- Additional Non-Vegetarian Meals (for more variety)
('Grilled Fish Tacos', 'Non-Vegetarian', NULL, 300, 20, 10, 30, 'Lunch'),
('Chicken Curry', 'Non-Vegetarian', 'Celiac', 450, 30, 20, 40, 'Dinner'),
('Beef Steak', 'Non-Vegetarian', 'Diabetes', 500, 40, 25, 20, 'Dinner'),
('Prawn Stir Fry', 'Non-Vegetarian', 'Heart Disease', 400, 30, 15, 30, 'Dinner'),

-- Additional Vegetarian Meals
('Mixed Veg Curry', 'Vegetarian', 'Hypertension', 350, 10, 15, 45, 'Dinner'),
('Dal Tadka', 'Vegetarian', 'Diabetes', 250, 12, 8, 30, 'Lunch'),
('Grilled Paneer Wrap', 'Vegetarian', 'Heart Disease', 400, 20, 15, 40, 'Lunch'),
('Mushroom Biryani', 'Vegetarian', 'Celiac', 450, 10, 10, 60, 'Dinner'),

-- Additional Vegan Meals
('Vegan Burger', 'Vegan', NULL, 400, 15, 20, 45, 'Lunch'),
('Vegan Smoothie Bowl', 'Vegan', 'Heart Disease', 300, 10, 10, 40, 'Breakfast'),
('Vegan Thai Curry', 'Vegan', 'Hypertension', 350, 12, 15, 40, 'Dinner'),
('Vegan Pasta', 'Vegan', 'Celiac', 450, 15, 10, 60, 'Dinner'),

-- Gluten-Free Meals
('Gluten-Free Pancakes', 'Gluten-Free', 'Celiac', 400, 10, 15, 60, 'Breakfast'),
('Gluten-Free Pizza', 'Gluten-Free', NULL, 450, 20, 20, 50, 'Lunch'),
('Gluten-Free Pasta Salad', 'Gluten-Free', 'Diabetes', 320, 10, 10, 45, 'Lunch'),
('Grilled Fish with Veggies', 'Gluten-Free', 'Heart Disease', 400, 30, 15, 30, 'Dinner'),

-- Dairy-Free Meals
('Dairy-Free Smoothie Bowl', 'Dairy-Free', NULL, 250, 5, 10, 40, 'Breakfast'),
('Dairy-Free Oatmeal', 'Dairy-Free', 'Hypertension', 200, 5, 5, 30, 'Breakfast'),
('Dairy-Free Salad with Tofu', 'Dairy-Free', 'Celiac', 300, 15, 10, 30, 'Lunch'),
('Dairy-Free Veggie Wrap', 'Dairy-Free', 'Diabetes', 350, 10, 10, 50, 'Lunch'),

-- Keto Meals
('Keto Egg Muffins', 'Keto', NULL, 200, 15, 10, 5, 'Breakfast'),
('Keto Chicken Caesar Salad', 'Keto', 'Heart Disease', 350, 25, 20, 10, 'Lunch'),
('Keto Salmon Bowl', 'Keto', 'Hypertension', 400, 30, 20, 10, 'Dinner'),
('Keto Avocado Smoothie', 'Keto', 'Diabetes', 250, 5, 20, 10, 'Breakfast'),

-- Low-Calorie Meals
('Low-Calorie Grilled Chicken', NULL, NULL, 150, 25, 5, 5, 'Lunch'),
('Low-Calorie Salad', NULL, 'Diabetes', 100, 5, 5, 10, 'Lunch'),
('Low-Calorie Vegetable Soup', NULL, 'Celiac', 120, 5, 5, 15, 'Dinner'),
('Low-Calorie Zucchini Noodles', NULL, 'Heart Disease', 180, 5, 5, 30, 'Dinner'),

-- High-Calorie Meals
('High-Calorie Smoothie', NULL, 'Diabetes', 600, 10, 20, 80, 'Breakfast'),
('High-Calorie Steak and Potatoes', NULL, 'Heart Disease', 700, 40, 30, 50, 'Dinner'),
('High-Calorie Veggie Lasagna', 'Vegetarian', NULL, 650, 20, 25, 80, 'Dinner'),
('High-Calorie Burrito', 'Non-Vegetarian', NULL, 800, 30, 30, 90, 'Lunch');




CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    meal_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);
INSERT INTO Orders (user_id, meal_id, order_date)
VALUES 
(1, 1, '2024-11-01'),
(2, 2, '2024-11-02'),
(3, 3, '2024-11-03');


CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    meal_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);
INSERT INTO Reviews (user_id, meal_id, rating, review_text, review_date)
VALUES 
(1, 1, 5, 'Delicious and healthy!', '2024-11-01'),
(2, 2, 4, 'Tasty but a bit too spicy.', '2024-11-02'),
(3, 3, 3, 'Average meal.', '2024-11-03');


CREATE TABLE Ingredients (
    ingredient_id INT AUTO_INCREMENT PRIMARY KEY,
    ingredient_name VARCHAR(100) NOT NULL
);
INSERT INTO Ingredients (ingredient_name)
VALUES 
('Chicken'),
('Lettuce'),
('Tomato'),
('Cheese'),
('Bread');


CREATE TABLE MealIngredients (
    meal_id INT,
    ingredient_id INT,
    quantity VARCHAR(50),
    PRIMARY KEY (meal_id, ingredient_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(ingredient_id)
);
INSERT INTO MealIngredients (meal_id, ingredient_id, quantity)
VALUES 
(1, 1, '200g'),
(1, 2, '50g'),
(1, 3, '30g'),
(2, 4, '100g'),
(2, 5, '2 slices');


ALTER TABLE Users
ADD COLUMN preferred_meal_time VARCHAR(50),
ADD COLUMN favorite_cuisine VARCHAR(50);


ALTER TABLE Meals
ADD COLUMN protein INT,
ADD COLUMN fat INT,
ADD COLUMN carbohydrates INT;


ALTER TABLE Meals
ADD COLUMN meal_category VARCHAR(50);


CREATE TABLE MealPlans (
    plan_id INT AUTO_INCREMENT PRIMARY KEY,
    plan_name VARCHAR(100) NOT NULL,
    description TEXT
);
INSERT INTO MealPlans (plan_name, description)
VALUES 
('Weight Loss Plan', 'A meal plan designed for weight loss.'),
('Muscle Gain Plan', 'A meal plan designed for muscle gain.');


CREATE TABLE PlanMeals (
    plan_id INT,
    meal_id INT,
    PRIMARY KEY (plan_id, meal_id),
    FOREIGN KEY (plan_id) REFERENCES MealPlans(plan_id),
    FOREIGN KEY (meal_id) REFERENCES Meals(meal_id)
);
INSERT INTO PlanMeals (plan_id, meal_id)
VALUES 
(1, 1),
(1, 2),
(2, 3),
(2, 4);










