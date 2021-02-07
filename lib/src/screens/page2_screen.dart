import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states_app/src/bloc/usuario/usuario_bloc.dart';
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
              onPressed: () {
                final Usuario newUser = new Usuario(nombre: 'Daniel', edad: 28, profesiones: ['App developer']);
                BlocProvider.of<UsuarioBloc>(context).add(
                  ActivarUsuario(newUser)
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: (){
                BlocProvider.of<UsuarioBloc>(context).add(
                  CambiarEdad(25)
                );
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Cambiar edad'),
            ),
            MaterialButton(
              onPressed: (){
                BlocProvider.of<UsuarioBloc>(context).add(
                  AddProfesion('Nueva profesión')
                );
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
