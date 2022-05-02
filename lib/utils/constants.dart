class Constants {
  static const Map firebaseErrorMsgs= {
    'email-already-in-use': 'El correo ya está registrado',
    'user-not-found': 'Correo/contraseña no válidos',
    'wrong-password': 'Correo/contraseña no válidos',
    'too-many-requests': 'Demasiados intentos. Vuelva a intentarlo más tarde'
  };

  static const List<String> commonModules = [
    'Pensamiento matemático',
    'Pensamiento analítico verbal',
    'Estructura de la lengua',
    'Comprensión Lectora',
  ];

  static const List<String> specialityModules = [
    'Cálculo',
    'Física'
  ];

  static const int totalQuestionsCommon = 30;
  static const int totalQuestionsSpecialty = 24;
  static const int totalQuestionsOfExam = 168;

  static const int falseSQLiteIntValue = 0;
  static const int trueSQLiteIntValue = 1;
}