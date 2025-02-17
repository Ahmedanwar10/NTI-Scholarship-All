import 'messages.dart';
import 'validation.dart';

void main() {
  print(Messages.welcome); 

  List<List<String>> seats = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, Map<String, String>> bookings = {};

  while (true) {
    print(Messages.menu);
    int choice = ValidatorTest.getInput<int>(
      validator: ValidatorTest.numberValidator(),
      promptType: 'menu' 
    );

    switch (choice) {
      case 1:
        bookSeat(seats, bookings);
        break;
      case 2:
        printSeats(seats);
        break;
      case 3:
        printUsers(bookings);
        break;
      case 4:
        print("\n👋 See You Back!\n");
        return;
      default:
        print(Messages.invalidChoice); // Use the invalid choice message
        break;
    }
  }
}

void printSeats(List<List<String>> seats) {
  print("\n🎭 Theater Seats:");
  for (var row in seats) {
    print(row.join(" "));
  }
}

void bookSeat(List<List<String>> seats, Map<String, Map<String, String>> bookings) {
  int row = ValidatorTest.getInput<int>(
    validator: ValidatorTest.numberValidator(),
    promptType: 'seatRow' // Use the seat row prompt handled in getInput
  ) - 1;

  int col = ValidatorTest.getInput<int>(
    validator: ValidatorTest.numberValidator(),
    promptType: 'seatCol' // Use the seat column prompt handled in getInput
  ) - 1;

  // Check if the seat is already booked
  if (ValidatorTest.isSeatBooked(seats, row, col)) {
    return bookSeat(seats, bookings); // Recursively call bookSeat to choose another seat
  }

  // Check if row and column are the same
  if (ValidatorTest.isRowAndColSame(row, col)) {
    return bookSeat(seats, bookings); // Recursively call bookSeat to re-enter the values
  }

  String name = ValidatorTest.getInput<String>(
    validator: (input) => input.isNotEmpty ? input : null,
    promptType: 'name' // Use the name prompt handled in getInput
  );

  String phone = ValidatorTest.getInput<String>(
    validator: (input) => input.isNotEmpty ? input : null,
    promptType: 'phone' // Use the phone prompt handled in getInput
  );

  seats[row][col] = 'B';
  bookings["${row + 1},${col + 1}"] = {"name": name, "phone": phone};

  print(Messages.seatBookedSuccess); // Use the seat booked success message
}

void printUsers(Map<String, Map<String, String>> bookings) {
  if (bookings.isEmpty) {
    print(Messages.noBookings); // Use the no bookings message
    return;
  }

  print(Messages.bookingDetails); // Use the booking details message
  for (var entry in bookings.entries) {
    print("🎟 Seat ${entry.key}: ${entry.value['name']} - ${entry.value['phone']}");
  }
}
