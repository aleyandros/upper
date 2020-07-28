class UserModel {
  String nombre;
  String apellido;
  String email;
  String celular;

  UserModel({this.nombre, this.apellido, this.email, this.celular});

  toJson() {
    return {
      "nombre": nombre,
      "apellido": apellido,
      "correo": email,
      "celular": celular,
    };
  }
}
