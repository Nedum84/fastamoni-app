class Validation {
  final String? value;
  const Validation(this.value);

  static bool isEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.trim());
  }

  static bool isPhone(String? phone) {
    if (phone == null) return false;
    final regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    return regExp.hasMatch(phone);
  }

  String? min(int min, {String? message}) {
    if (value != null && value!.length < min) {
      return message ?? 'Enter min. of $min characters';
    }

    return null;
  }

  String? max(int max, {String? message}) {
    if (value != null && value!.length > max) {
      return message ?? 'Enter max. of $max characters';
    }

    return null;
  }

  String? validate(List<ValidationItem> options) {
    final inputValue = value?.trim();

    for (var item in options) {
      //Required
      if (item.type == ValidationType.REQUIRED) {
        if (inputValue == null || inputValue.isEmpty) {
          return item.message ?? "This field is required";
        }
      }
      // Email
      if (item.type == ValidationType.EMAIL && inputValue!.isNotEmpty) {
        final isMatch = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(inputValue);

        if (!isMatch) {
          return item.message ?? "Enter valid email";
        }
      }
      // Phone
      if (item.type == ValidationType.PHONE && inputValue!.isNotEmpty) {
        final isMatch = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(inputValue);
        if (!isMatch) {
          return item.message ?? "Enter valid phone number";
        }
      }
      // Full Name
      if (item.type == ValidationType.FULL_NAME && inputValue!.isNotEmpty) {
        if (inputValue.split(' ').length < 2) {
          return item.message ?? "Enter your full name";
        }
      }
      // Min
      if (item.type == ValidationType.MIN && inputValue!.isNotEmpty) {
        if (item.value == null) {
          return 'Validation error(DEV), supply min amount';
        }
        if (inputValue.length < item.value!) {
          return item.message ?? 'Enter min. of ${item.value} characters';
        }
      }
      // Max
      if (item.type == ValidationType.MAX && inputValue!.isNotEmpty) {
        if (item.value == null) {
          return 'Validation error(DEV), supply min amount';
        }
        if (inputValue.length > item.value!) {
          return item.message ?? 'Enter max. of ${item.value} characters';
        }
      }
    }

    return null;
  }
}

class ValidationItem {
  final ValidationType type;
  final String? message;
  final int? value;

  const ValidationItem(this.type, {this.message, this.value});
}

enum ValidationType {
  REQUIRED,
  MIN,
  MAX,
  EMAIL,
  PHONE,
  FULL_NAME,
}
