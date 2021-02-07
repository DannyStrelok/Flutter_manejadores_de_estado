import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:meta/meta.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(
    UsuarioEvent event,
  ) async* {
    print('usuario event mapeventtostate');
    print(event);
    if (event is ActivarUsuario) {
      yield state.copyWith(
          usuario: event.usuario); //UsuarioState( user: event.usuario );
    } else if (event is CambiarEdad) {
      yield state.copyWith(
          usuario: state.usuario.copyWith(
              edad: event
                  .edad)); //UsuarioState(user: state.usuario.copyWith(edad: event.edad));
    } else if (event is AddProfesion) {
      final allProfesiones = [
        ...state.usuario.profesiones,
        '${event.profesion} ${state.usuario.profesiones.length + 1}'
      ];
      yield state.copyWith(usuario: state.usuario.copyWith(profesiones: allProfesiones) );
      // UsuarioState(
      //     user: state.usuario.copyWith(profesiones: allProfesiones));
    } else if (event is CleanUsuario) {
      yield state.estadoInicial(); //UsuarioState();
    }
  }
}
