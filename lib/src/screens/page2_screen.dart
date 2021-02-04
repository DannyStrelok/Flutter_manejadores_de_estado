import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                final Usuario newUsuario = new Usuario(nombre: 'Daniel', edad: 28, profesiones: ['Flutter', 'React']);
                context.read<UsuarioCubit>().seleccionarUsuario(newUsuario);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: (){
                context.read<UsuarioCubit>().cambiarEdad(25);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Cambiar edad'),
            ),
            MaterialButton(
              onPressed: (){
                context.read<UsuarioCubit>().addProfesion('Ahora con BLoC');
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Añadir profesión'),
            ),
          ],
        ),
      ),
    );
  }
}
