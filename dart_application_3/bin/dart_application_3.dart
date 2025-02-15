import 'dart:io';

class Seat {
  String status;
  Seat() : status = 'E';
}

class Theater {
  final int rows;
  final int cols;
  late List<List<Seat>> seats;

  Theater(this.rows, this.cols) {
    seats = List.generate(rows, (_) => List.generate(cols, (_) => Seat()));
  }

  void displaySeats() {
    print("Theater Seat Layout:");
    for (var row in seats) {
      print(row.map((seat) => seat.status).join(' '));
    }
    print("");
  }

  bool isSeatAvailable(int row, int col) => seats[row][col].status == 'E';

  void bookSeat(int row, int col) {
    seats[row][col].status = 'B';
  }
}

class Booking {
  final String name;
  final String phone;
  final int row;
  final int col;

  Booking(this.name, this.phone, this.row, this.col);
}

class BookingSystem {
  final Theater theater;
  final List<Booking> bookings = [];

  BookingSystem(this.theater);

  void bookSeat(String name, String phone, int row, int col) {
    if (theater.isSeatAvailable(row, col)) {
      theater.bookSeat(row, col);
      bookings.add(Booking(name, phone, row, col));
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
      for (var booking in bookings) {
        print("Seat (\${booking.row}, \${booking.col}) - Name: \${booking.name}, Phone: \${booking.phone}");
      }
    }
  }
}

void main() {
  final theater = Theater(5, 5);
  final bookingSystem = BookingSystem(theater);

  while (true) {
    theater.displaySeats();

    stdout.write("Enter your name (or press Enter to quit): ");
    final name = stdin.readLineSync()?.trim();
    if (name == null || name.isEmpty) break;

    stdout.write("Enter your phone number: ");
    final phone = stdin.readLineSync()?.trim() ?? "";

    stdout.write("Enter row (0-4): ");
    final row = int.tryParse(stdin.readLineSync() ?? "") ?? -1;
    stdout.write("Enter column (0-4): ");
    final col = int.tryParse(stdin.readLineSync() ?? "") ?? -1;

    if (row >= 0 && row < 5 && col >= 0 && col < 5) {
      bookingSystem.bookSeat(name, phone, row, col);
    } else {
      print("Invalid seat selection. Please try again.\n");
    }
  }

  theater.displaySeats();
  bookingSystem.displayBookings();
}
