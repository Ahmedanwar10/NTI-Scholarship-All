import 'dart:io';
import 'messages.dart'; // Import the messages file

class ValidatorTest {
  // 📌 Reusable input validator for any type
  static T getInput<T>({required T? Function(String) validator, required String promptType}) {
    String prompt;

    switch (promptType) {
      case 'seatRow':
        prompt = Messages.seatRowPrompt;
        break;
      case 'seatCol':
        prompt = Messages.seatColPrompt;
        break;
      case 'name':
        prompt = Messages.namePrompt;
        break;
      case 'phone':
        prompt = Messages.phonePrompt;
        break;
      default:
        prompt = '';
    }

    while (true) {
      if (prompt.isNotEmpty) print(prompt); // Print the prompt for user input

      String? input = stdin.readLineSync()?.trim();

      if (input == null || input.isEmpty) {
        print(Messages.inputErrorEmpty); // Use the message for empty input
        continue;
      }

      T? validatedValue = validator(input);
      if (validatedValue != null) return validatedValue;

      print(Messages.inputErrorInvalid);
    }
  }

   static int? Function(String) numberValidator() {
    return (String input) {
      // Try to parse the input as an integer
      int? value = int.tryParse(input);
      return value; // Return the number if valid, otherwise null
    };
  }

  static bool isSeatBooked(List<List<String>> seats, int row, int col) {
    if (seats[row][col] == 'B') {
      print(Messages.seatBooked); 
      return true;
    }
    return false;
  }

  static bool isRowAndColSame(int row, int col) {
    if (row == col) {
      print(Messages.rowAndColError); 
      return true;
    }
    return false;
  }
}
