
import 'dart:async';

import 'package:flutter_states_app/src/models/Usuario.dart';

class _UsuarioService {
  Usuario _usuario;
  StreamController<Usuario> _usuarioStreamController = new StreamController<Usuario>.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  Usuario get usuario => _usuario;
  bool get existeUsuario => (this._usuario != null) ? true : false;

  void cargarUsuario(Usuario value) {
    _usuario = value;
    _usuarioStreamController.add(value);
  }

  void cambiarEdad(int edad) {
    _usuario.edad = edad;
    _usuarioStreamController.add(this._usuario);
  }

  dispose() {
    _usuarioStreamController?.close();
  }

}

final usuarioService = new _UsuarioService();