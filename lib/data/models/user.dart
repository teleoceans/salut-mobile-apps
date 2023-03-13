class User {
  String? name;
  String? email;
  String? password;
  String? birthday;
  String? gender;
  String? phoneNumber;
  String? authToken;
  User({
    this.name,
    this.email,
    this.password,
    this.birthday,
    this.gender,
    this.phoneNumber,
    this.authToken,
  });

  set setName(String value) {
    name = value;
  }

  set setEmail(String value) {
    email = value;
  }

  set setPassword(String value) {
    password = value;
  }

  set setbirthday(String value) {
    birthday = value;
  }

  set setGender(String value) {
    gender = value;
  }

  set setPhoneNumber(String value) {
    phoneNumber = value;
  }

  set setAuthToken(String value) {
    authToken = value;
  }

  // String get getName {
  //   return name!;
  // }

  String get getEmail {
    return email!;
  }

  String get getBirthday {
    return birthday!;
  }

  String get getPassword {
    return password!;
  }

  String get getAuthToken {
    return authToken!;
  }

 
}
