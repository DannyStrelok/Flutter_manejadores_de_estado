import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:flutter_states_app/src/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

class Page1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('pagina1'),
        actions: [
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                usuarioProvider.limpiarUsuario();
              })
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text('cabecera')),
            Container(
              child: Text('cuerpo'),
            )
          ],
        ),
      ),
      body: usuarioProvider.existeUsuario
          ? InformacionUsuario(usuarioProvider.usuario)
          : Center(
              child: Text('No hay usuario'),
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan_outlined),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  InformacionUsuario(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('nombre: ${this.usuario.nombre}'),
            ),
            ListTile(
              title: Text('edad: ${this.usuario.edad}'),
            ),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ...usuario.profesiones
                .map((profesion) => ListTile(
                      title: Text(profesion),
                    ))
                .toList(),
            // ListTile(
            //   title: Text('Profesión 1:'),
            // ),
          ],
        ),
      ),
    );
  }
}
