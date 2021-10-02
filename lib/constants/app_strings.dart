class School {
  static const schoolName = "Flourish Hall";
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please enter an E-mail address";
const String kInvalidEmailError = "Please enter a valid E-mail address";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "Enter a password greater that 8 chars";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please enter your first name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kDateNullError = "Please select a date";
const String kGenderNullError = "Please enter your gender";
const String kLastNamelNullError = "Please enter your last name";
