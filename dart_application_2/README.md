
# 🎭 Theater Seat Booking System (Dart)  

This Dart program simulates a simple theater seat booking system using a **5x5 seating grid**. Users can book seats by entering their **name, phone number, and seat position**. The system ensures that a seat is available before confirming a booking. At the end, it displays the final **seat layout** and a **booking list**.  

## 🚀 Features  
✅ 2D array representation of theater seats (5x5).  
✅ Each seat can be **empty (E)** or **booked (B)**.  
✅ Users enter their **name, phone number, and seat position** to book.  
✅ Checks seat availability before booking.  
✅ Stores booking details in a **map** (`seat_position -> user data`).  
✅ Allows multiple users to book until they choose to exit.  
✅ Displays the **seat layout and booking list** at the end.  

## 🛠 How It Works  
1️⃣ The system prints the theater seat layout.  
2️⃣ The user enters their name and phone number.  
3️⃣ They provide a **row** and **column** for their desired seat.  
4️⃣ If the seat is **available (E)**, it gets booked (`B` status).  
5️⃣ If the seat is already booked, a message notifies the user.  
6️⃣ The process repeats until the user types `'exit'`.  
7️⃣ The final **seat layout** and **booking list** are displayed.  

## 📌 Example Output  
```
Theater Seat Layout:  
E E E E E  
E E B E E  
E E E E E  
E B E E E  
E E E E E  

Booking List:  
Seat (1, 2) - Name: Alice, Phone: 123456789  
Seat (3, 1) - Name: Bob, Phone: 987654321  
```

## 📂 Technologies Used  
- **Dart** (CLI-based console application).  

## 📜 How to Run  
1️⃣ Install Dart SDK on your system.  
2️⃣ Clone this repository.  
3️⃣ Run the script using:  
```bash
dart run theater_booking.dart
```

---
