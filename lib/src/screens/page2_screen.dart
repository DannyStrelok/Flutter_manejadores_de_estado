import 'package:flutter/material.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:flutter_states_app/src/services/usuario_service.dart';

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            if(snapshot.hasError) {
              return Text('Página 2');
            }
            return snapshot.hasData
                ? Text('Nombre ${snapshot.data.nombre}')
                : Text('Página 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                final usuario = new Usuario(nombre: 'Dani', edad: 28);
                usuarioService.cargarUsuario(usuario);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: (){
                usuarioService.cambiarEdad(26);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Cambiar edad'),
            ),
            MaterialButton(
              onPressed: (){},
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
