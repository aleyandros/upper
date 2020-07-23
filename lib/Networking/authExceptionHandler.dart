enum AuthResultStatus {
  successful,
  emailAlreadyExists,
  wrongPassword,
  invalidEmail,
  userNotFound,
  userDisabled,
  operationNotAllowed,
  tooManyRequests,
  undefined,
}

class AuthExceptionHandler {
  static handleException(e) {
    print(e.code);
    var status;
    switch (e.code) {
      case "ERROR_INVALID_EMAIL":
        status = AuthResultStatus.invalidEmail;
        break;
      case "ERROR_WRONG_PASSWORD":
        status = AuthResultStatus.wrongPassword;
        break;
      case "ERROR_USER_NOT_FOUND":
        status = AuthResultStatus.userNotFound;
        break;
      case "ERROR_USER_DISABLED":
        status = AuthResultStatus.userDisabled;
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        status = AuthResultStatus.tooManyRequests;
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        status = AuthResultStatus.operationNotAllowed;
        break;
      case "ERROR_EMAIL_ALREADY_IN_USE":
        status = AuthResultStatus.emailAlreadyExists;
        break;
      default:
        status = AuthResultStatus.undefined;
    }
    return status;
  }

  ///
  /// Accepts AuthExceptionHandler.errorType
  ///
  static generateExceptionMessage(exceptionCode) {
    String errorMessage;
    switch (exceptionCode) {
      case AuthResultStatus.invalidEmail:
        errorMessage = "Tu correo parece no ser valido.";
        break;
      case AuthResultStatus.wrongPassword:
        errorMessage = "Tu contraseña es incorrecta.";
        break;
      case AuthResultStatus.userNotFound:
        errorMessage = "No existe usuario con este correo.";
        break;
      case AuthResultStatus.userDisabled:
        errorMessage = "Esta cuenta ha sido desabilitada.";
        break;
      case AuthResultStatus.tooManyRequests:
        errorMessage = "Intenta otra vez más tarde.";
        break;
      case AuthResultStatus.operationNotAllowed:
        errorMessage = "Ingresar con correo y contraseña ha sido desabilitado";
        break;
      case AuthResultStatus.emailAlreadyExists:
        errorMessage =
            "Este correo ya ha sido registrado. Intenta iniciar o restablece tu contraseña";
        break;
      default:
        errorMessage = "Oops, no sabemos que pasó, intenta otra vez :)";
    }

    return errorMessage;
  }
}
