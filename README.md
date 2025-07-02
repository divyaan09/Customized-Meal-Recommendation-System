# Customized Meal Recommendation System

This project is a **Customized Meal Recommendation System** built in Python. It uses user preferences and nutritional requirements to generate meal suggestions tailored to the individual's dietary needs and lifestyle. It also stores and retrieves user and meal data using a **MySQL database**.

## 🌟 Features

- Personalized meal suggestions based on calorie and nutrient requirements.
- User input for dietary preferences and restrictions.
- Nutritional calculations (e.g., calories, proteins, fats, carbohydrates).
- Stores user and meal data in MySQL database.
- Simple command-line interface for interaction.
- Modular and easily extendable codebase.

## 🛠️ Technologies Used

- Python 3
- MySQL (via `mysql-connector-python`)
- pandas
- numpy

> No external API or GUI is used – this is a CLI-based prototype focusing on logic, functionality, and database integration.

## 🧱 Project Structure

```
📁 Customized_Meal_Recommendation_System
├── b080a231-c4c8-4df8-9670-a20bfc85e0d8.py
└── README.md
```

## 🚀 Getting Started

### Prerequisites

Ensure you have Python and MySQL installed.

Check Python:

```bash
python --version
```

Install required Python libraries:

```bash
pip install mysql-connector-python pandas numpy
```

Make sure your MySQL server is running and create the necessary database and tables as per the code.

### Installation

Clone this repository or download the ZIP:

```bash
git clone https://github.com/yourusername/CustomizedMealRecommender.git
cd CustomizedMealRecommender
```

### Running the Project

```bash
python b080a231-c4c8-4df8-9670-a20bfc85e0d8.py
```

Follow the on-screen instructions to get meal recommendations.

## ⚙️ MySQL Setup

- Create a database (e.g., `meal_recommendation`)
- Create relevant tables (`users`, `meals`, etc.)
- Make sure to update database credentials inside the Python file

Example SQL:

```sql
CREATE DATABASE meal_recommendation;
USE meal_recommendation;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  age INT,
  weight FLOAT,
  height FLOAT,
  preferences TEXT
);

CREATE TABLE meals (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  calories INT,
  protein FLOAT,
  fat FLOAT,
  carbs FLOAT
);
```

## 📸 Screenshots

_Add CLI screenshots here if needed._

## 🙋‍♀️ How It Works

1. User inputs age, weight, height, dietary preferences, etc.
2. System computes the BMR and daily nutritional needs.
3. Matches meals from the MySQL database based on compatibility.
4. Outputs a list of recommended meals.

## 📌 Future Improvements

- Integration with a food API (e.g., Edamam, Spoonacular).
- GUI (Tkinter/Web-based) interface.
- Database of meals with images and recipes.
- Mobile app version.

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss the changes.

## 📄 License

This project is open source and free to use under the MIT License.

## 👤 Author

**Divyanshu Raj**  
Aspiring Cybersecurity & Software Engineering Enthusiast  
GitHub: [divyaan09](https://github.com/yourusername)

---

> This project was created as part of a learning experience to understand how recommendation systems work using simple logic, MySQL, and Python.

