class UserModel {
  String nombre;
  String apellido;
  String celular;

  UserModel({this.nombre, this.apellido, this.celular});

  toJson() {
    return {
      "nombre": nombre,
      "apellido": apellido,
      "celular": celular,
    };
  }
}
