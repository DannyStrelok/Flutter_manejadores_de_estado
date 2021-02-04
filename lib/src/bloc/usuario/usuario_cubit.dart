import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:meta/meta.dart';

part 'usuario_state.dart';

class UsuarioCubit extends Cubit<UsuarioState> {

  UsuarioCubit() : super(UsuarioInitial());

  void seleccionarUsuario(Usuario usuario) {
    emit( new UsuarioActivo(usuario) );
  }

  void cambiarEdad(int edad) {

    final currentState = state;
    if(currentState is UsuarioActivo) {
      final nuevoUsuario = currentState.usuario.copiarUsuario(edad: 25);
      emit( UsuarioActivo(nuevoUsuario) );
    }

  }

  void addProfesion(String profesion) {

    final currentState = state;
    if(currentState is UsuarioActivo) {
      final List<String> profesiones = currentState.usuario.profesiones;
      profesiones.add(profesion);
      // final profesiones = [
      //   ...currentState.usuario.profesiones,
      //   profesion
      // ];
      final nuevoUsuario = currentState.usuario.copiarUsuario(profesiones: profesiones);
      emit( UsuarioActivo(nuevoUsuario) );
    }

  }

  void borrarUsuario() {
    emit(UsuarioInitial());
  }

}
