import 'package:flutter/material.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:flutter_states_app/src/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          usuarioProvider.existeUsuario ? usuarioProvider.usuario.nombre : 'Página 2'
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: (){
                usuarioProvider.usuario = new Usuario(nombre: 'Daniel', edad: 28, profesiones: ['App developer', 'front developer']);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: (){
                usuarioProvider.setEdad(30);
              },
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Cambiar edad'),
            ),
            MaterialButton(
              onPressed: (){
                usuarioProvider.addProfesion('NUEVA PROFESIÓN');
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
