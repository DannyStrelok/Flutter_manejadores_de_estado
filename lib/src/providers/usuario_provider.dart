import 'package:flutter/material.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';

class UsuarioProvider with ChangeNotifier {

  Usuario _usuario;

  Usuario get usuario => _usuario;

  bool get existeUsuario => this._usuario != null ? true : false;

  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  void setEdad(int edad) {
    _usuario.edad = edad;
    notifyListeners();
  }

  void addProfesion(String profesion) {
    _usuario.profesiones.add('$profesion - ${_usuario.profesiones.length+1}');
    notifyListeners();
  }

  void limpiarUsuario() {
    _usuario = null;
    notifyListeners();
  }

}