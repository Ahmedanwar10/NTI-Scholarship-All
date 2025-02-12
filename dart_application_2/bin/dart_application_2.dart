import 'dart:io';

void main() {
  List<List<String>> seats = List.generate(5, (i) { return List.filled(5, 'E');});
  Map<String, Map<String, String>> bookings = {};

  while (true) {
    printSeats(seats);

    print("Enter your name ");
    String name = stdin.readLineSync()!;
    if (name.trim().isEmpty) break;

    print("Enter your phone number ");
    String phone = stdin.readLineSync()!;

    print("Enter row (0-4): ");
    int row = int.parse(stdin.readLineSync()!);
    print("Enter column (0-4): ");
    int col = int.parse(stdin.readLineSync()!);

    String seatKey = "($row, $col)";

    if (seats[row][col] == 'E') {
      seats[row][col] = 'B';
      bookings[seatKey] = {'Name': name, 'Phone': phone};
      print("Seat booked successfully!\n");
    } else {
      print(" this seat is already booked.\n");
    }
  }

  printSeats(seats);
  printBookings(bookings);
}

void printSeats(List<List<String>> seats) {
  print("Theater Seat Layout:");
  for (var row in seats) {
    print(row.join(' '));
  }
  print("");
}

void printBookings(Map<String, Map<String, String>> bookings) {
  print("Booking List:");
  if (bookings.isEmpty) {
    print("No bookings yet.");
  } else {
    bookings.forEach((seat, details) {
      print("Seat $seat - Name: ${details['Name']}, Phone: ${details['Phone']}");
    });
  }
}
