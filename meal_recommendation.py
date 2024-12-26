import mysql.connector

# Function to connect to the database
def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",   # Use your MySQL credentials
        password="@Divyaan2004",
        database="meal_db"
    )

# Function to register a new user
def register_user():
    username = input("Enter your username: ")
    dietary_preference = input("Enter your dietary preference (e.g., Vegetarian, Non-Vegetarian\
    , Vegan, Gluten-Free, Dairy-Free, Keto, Low-Calorie, High-Calorie): ")
    health_conditions = input("Enter any health conditions (e.g., Diabetes, Celiac, \
    Hypertension, Heart Disease) or type 'None': ")
    preferred_meal_time = input("Enter your preferred meal time (e.g., Breakfast, Lunch, Dinner): ")
    favorite_cuisine = input("Enter your favorite cuisine or type 'None': ")

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()
    
    try:
        cursor.execute("""
            INSERT INTO Users (username, dietary_preference, health_conditions, preferred_meal_time, favorite_cuisine)
            VALUES (%s, %s, %s, %s, %s)
        """, (username, dietary_preference, health_conditions, preferred_meal_time, favorite_cuisine))
        conn.commit()
        print(f"User {username} registered successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to recommend meals based on user input
def recommend_meals():
    username = input("Enter your username: ")

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor(buffered=True)

    # Fetch the user's dietary preference and health conditions from the Users table
    cursor.execute("SELECT dietary_preference, health_conditions FROM Users WHERE username = %s", (username,))
    user = cursor.fetchone()

    if not user:
        print("User not found!")
        cursor.close()
        conn.close()
        return

    dietary_preference, health_conditions = user

    # Prepare the query
    query = """
        SELECT meal_name, calories, protein, fat, carbohydrates, meal_category
        FROM Meals
        WHERE dietary_preference = %s
          AND (health_conditions LIKE %s OR health_conditions IS NULL)
    """
    
    try:
        # Execute the query with parameters
        if health_conditions:
            cursor.execute(query, (dietary_preference, f"%{health_conditions}%"))
        else:
            cursor.execute(query, (dietary_preference, '%'))

        meals = cursor.fetchall()

        if meals:
            print(f"Recommended meals for {username}:")
            for meal in meals:
                print(f"{meal[0]} - {meal[1]} calories, {meal[2]}g protein, {meal[3]}g fat, \
                    {meal[4]}g carbohydrates, Category: {meal[5]}")
        else:
            print("No meals found matching your preferences.")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to place an order
def place_order():
    username = input("Enter your username: ")
    meal_id = int(input("Enter the meal ID you want to order: "))

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Fetch the user_id from the Users table
        cursor.execute("SELECT user_id FROM Users WHERE username = %s", (username,))
        user = cursor.fetchone()

        if not user:
            print("User not found!")
            return

        user_id = user[0]

        # Insert the order
        cursor.execute("""
            INSERT INTO Orders (user_id, meal_id, order_date)
            VALUES (%s, %s, CURDATE())
        """, (user_id, meal_id))
        conn.commit()
        print("Order placed successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        # Ensure all results are fetched before closing the cursor
        if cursor.with_rows:
            cursor.fetchall()
        cursor.close()
        conn.close()

# Function to add a review
def add_review():
    username = input("Enter your username: ")
    meal_id = int(input("Enter the meal ID you want to review: "))
    rating = int(input("Enter your rating (1-5): "))
    review_text = input("Enter your review: ")

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()

    # Fetch the user_id from the Users table
    cursor.execute("SELECT user_id FROM Users WHERE username = %s", (username,))
    user = cursor.fetchone()

    if not user:
        print("User not found!")
        cursor.close()
        conn.close()
        return

    user_id = user[0]

    try:
        cursor.execute("""
            INSERT INTO Reviews (user_id, meal_id, rating, review_text, review_date)
            VALUES (%s, %s, %s, %s, CURDATE())
        """, (user_id, meal_id, rating, review_text))
        conn.commit()
        print("Review added successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to add ingredients to a meal
def add_ingredients():
    meal_id = int(input("Enter the meal ID: "))
    ingredient_name = input("Enter the ingredient name: ")
    quantity = input("Enter the quantity: ")

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Insert ingredient if it doesn't exist
        cursor.execute("SELECT ingredient_id FROM Ingredients WHERE ingredient_name = %s", (ingredient_name,))
        ingredient = cursor.fetchone()
        if not ingredient:
            cursor.execute("INSERT INTO Ingredients (ingredient_name) VALUES (%s)", (ingredient_name,))
            conn.commit()
            ingredient_id = cursor.lastrowid
        else:
            ingredient_id = ingredient[0]

        # Insert into MealIngredients
        cursor.execute("""
            INSERT INTO MealIngredients (meal_id, ingredient_id, quantity)
            VALUES (%s, %s, %s)
        """, (meal_id, ingredient_id, quantity))
        conn.commit()
        print("Ingredient added successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to create a meal plan
def create_meal_plan():
    plan_name = input("Enter the meal plan name: ")
    description = input("Enter the meal plan description: ")

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            INSERT INTO MealPlans (plan_name, description)
            VALUES (%s, %s)
        """, (plan_name, description))
        conn.commit()
        plan_id = cursor.lastrowid
        print(f"Meal plan {plan_name} created successfully with ID {plan_id}!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to add meals to a meal plan
def add_meals_to_plan():
    plan_id = int(input("Enter the meal plan ID: "))
    meal_id = int(input("Enter the meal ID to add to the plan: "))

    # Establish database connection
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        cursor.execute("""
            INSERT INTO PlanMeals (plan_id, meal_id)
            VALUES (%s, %s)
        """, (plan_id, meal_id))
        conn.commit()
        print("Meal added to plan successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Function to insert sample data into the new tables
def insert_sample_data():
    conn = get_db_connection()
    cursor = conn.cursor()

    try:
        # Insert sample data into Orders table
        cursor.execute("""
            INSERT INTO Orders (user_id, meal_id, order_date)
            VALUES 
            (1, 1, '2024-11-01'),
            (2, 2, '2024-11-02'),
            (3, 3, '2024-11-03')
        """)

        # Insert sample data into Reviews table
        cursor.execute("""
            INSERT INTO Reviews (user_id, meal_id, rating, review_text, review_date)
            VALUES 
            (1, 1, 5, 'Delicious and healthy!', '2024-11-01'),
            (2, 2, 4, 'Tasty but a bit too spicy.', '2024-11-02'),
            (3, 3, 3, 'Average meal.', '2024-11-03')
        """)

        # Insert sample data into Ingredients table
        cursor.execute("""
            INSERT INTO Ingredients (ingredient_name)
            VALUES 
            ('Chicken'),
            ('Lettuce'),
            ('Tomato'),
            ('Cheese'),
            ('Bread')
        """)

                # Insert sample data into MealIngredients table
        cursor.execute("""
            INSERT INTO MealIngredients (meal_id, ingredient_id, quantity)
            VALUES 
            (1, 1, '200g'),
            (1, 2, '50g'),
            (1, 3, '30g'),
            (2, 4, '100g'),
            (2, 5, '2 slices')
        """)

        # Insert sample data into MealPlans table
        cursor.execute("""
            INSERT INTO MealPlans (plan_name, description)
            VALUES 
            ('Weight Loss Plan', 'A meal plan designed for weight loss.'),
            ('Muscle Gain Plan', 'A meal plan designed for muscle gain.')
        """)

        # Insert sample data into PlanMeals table
        cursor.execute("""
            INSERT INTO PlanMeals (plan_id, meal_id)
            VALUES 
            (1, 1),
            (1, 2),
            (2, 3),
            (2, 4)
        """)

        conn.commit()
        print("Sample data inserted successfully!")
    except mysql.connector.Error as err:
        print(f"Error: {err}")
    finally:
        cursor.close()
        conn.close()

# Main menu for the system
def main_menu():
    while True:
        print("\n--- Meal Plan Recommendation System ---")
        print("1. Register User")
        print("2. Get Meal Recommendations")
        print("3. Place an Order")
        print("4. Add a Review")
        print("5. Add Ingredients to a Meal")
        print("6. Create a Meal Plan")
        print("7. Add Meals to a Plan")
        print("8. Insert Sample Data")
        print("9. Exit")
        choice = input("Choose an option: ")

        if choice == '1':
            register_user()
        elif choice == '2':
            recommend_meals()
        elif choice == '3':
            place_order()
        elif choice == '4':
            add_review()
        elif choice == '5':
            add_ingredients()
        elif choice == '6':
            create_meal_plan()
        elif choice == '7':
            add_meals_to_plan()
        elif choice == '8':
            insert_sample_data()
        elif choice == '9':
            print("Exiting the system.")
            break
        else:
            print("Invalid choice! Please try again.")

if __name__ == '__main__':
    main_menu()
