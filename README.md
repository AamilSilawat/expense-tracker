# Expense Tracker

A **Personal Expense Tracker** mobile application built with **Flutter** using **GetX** for state management, **SQLite** for data persistence, and local notifications for daily reminders.

## Features
- Add, Edit, and Delete Expenses
- Categorize expenses
- View expense summaries
- Dark and Light mode support
- Local Notifications for daily expense reminders

## Installation & Setup

### **1. Clone the Repository**
```sh
git clone https://github.com/AamilSilawat/expense-tracker.git
cd expense-tracker
```

### **2. Install Dependencies**
```sh
flutter pub get
```

### **3. Run the App**
```sh
flutter run
```

## **Project Structure**
```
lib/
│── main.dart                 # Entry point of the app
│
├── core/                     # Common utilities, themes, database helper
│
├── data/                     # SQLite database integration and repositories
│
├── models/                   # Expense model
│
├── controllers/              # GetX controllers
│
├── screens/                  # UI screens (Home, Add Expense, Edit Expense)
│
├── utils/                    # Helper functions and constants
```

## **Database Setup**
The app uses **SQLite** to store expense data. The database is initialized when the app starts.

## **Testing**
To run unit tests:
```sh
flutter test
```

## **Build Release APK**
```sh
flutter build apk --release
```

## **Contributing**
Pull requests are welcome. Please open an issue first to discuss any changes.

## **License**
This project is licensed under the MIT License.

