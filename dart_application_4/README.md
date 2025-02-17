Code Description: Theater Seat Booking App 🎭
This code is a simple theater seat booking application built using Dart. It allows users to book seats, view seat availability, and check user booking details.

Main Features:
✅ Book a seat after checking its availability.
✅ View the theater seat map to see booked and available seats.
✅ Display user booking details (name and phone number).
✅ Validate user input to prevent errors.

Code Components:
🔹 Messages.dart: Contains all text messages used in the app, such as prompts and error messages.
🔹 Validation.dart: Includes validation functions to check if a seat is booked or if row and column values are the same.
🔹 main.dart: Manages the application logic, including user input, booking handling, and displaying data.

How It Works:
1️⃣ The app displays a menu with options (Book a seat - View seats - View user data - Exit).
2️⃣ If the user selects Book a Seat, they enter row and column numbers, then name and phone number.
3️⃣ The app checks if the seat is available or already booked.
4️⃣ If the booking is successful, the seat map updates, and the user's data is stored.
5️⃣ The user can view the theater layout or check booking details at any time.

Example Usage:
vbnet
Copy
Edit
🎭 Welcome To Our Theater 🎭

Press 1 to book a new seat
Press 2 to show the theater seats
Press 3 to show users' data
Press 4 to exit

📌 Enter seat row (1-5): 2
📌 Enter seat column (1-5): 3
📌 Enter your name: Ahmed
📌 Enter your phone number: 01012345678

✅ Seat booked successfully!
Future Enhancements:
🔹 Support more than 5 rows and columns for larger theaters.
🔹 Improve user interface with graphical representation.
🔹 Add seat cancellation and rebooking options.

📌 This project is a great practice for handling lists, maps, and user input validation in Dart! 🚀
