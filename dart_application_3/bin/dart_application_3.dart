import 'dart:io';

class SeatBookingSystem {
  List<List<String>> seats;
  Map<String, Map<String, String>> bookings;

  SeatBookingSystem(int rows, int cols)
      : seats = List.generate(rows, (i) => List.filled(cols, 'E')),
        bookings = {};

  void displaySeats() {
    print("Theater Seat Layout:");
    for (var row in seats) {
      print(row.join(' '));
    }
    print("");
  }

  void bookSeat(String name, String phone, int row, int col) {
    String seatKey = "($row, $col)";
    if (seats[row][col] == 'E') {
      seats[row][col] = 'B';
      bookings[seatKey] = {'Name': name, 'Phone': phone};
      print("Seat booked successfully!\n");
    } else {
      print("This seat is already booked.\n");
    }
  }

  void displayBookings() {
    print("Booking List:");
    if (bookings.isEmpty) {
      print("No bookings yet.");
    } else {
      bookings.forEach((seat, details) {
        print("Seat $seat - Name: \${details['Name']}, Phone: \${details['Phone']}");
      });
    }
  }
}

void main() {
  SeatBookingSystem bookingSystem = SeatBookingSystem(5, 5);

  while (true) {
    bookingSystem.displaySeats();

    print("Enter your name (or press Enter to quit): ");
    String name = stdin.readLineSync()!;
    if (name.trim().isEmpty) break;

    print("Enter your phone number: ");
    String phone = stdin.readLineSync()!;

    print("Enter row (0-4): ");
    int row = int.parse(stdin.readLineSync()!);
    print("Enter column (0-4): ");
    int col = int.parse(stdin.readLineSync()!);

    bookingSystem.bookSeat(name, phone, row, col);
  }

  bookingSystem.displaySeats();
  bookingSystem.displayBookings();
}
