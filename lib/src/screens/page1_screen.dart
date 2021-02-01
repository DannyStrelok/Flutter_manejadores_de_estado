import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';
import 'package:flutter_states_app/src/services/usuario_service.dart';

class Page1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina1'),
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
      body: StreamBuilder(
        stream: usuarioService.usuarioStream,
        builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text('Error de stream'),
            );
          }
          if (snapshot.hasData) {
            return InformacionUsuario(snapshot.data);
          }
          return Center(
            child: Text('Sin información'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan_outlined),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
      //StreamBuilder(stream: stream, builder: (BuildContext context, AsyncSnapshot snapshot) {if(snapshot.hasError) return ; switch (snapshot.connectionState) {case ConnectionState.none: return ConnectionNone;case ConnectionState.waiting: return ConnectionWaiting;case ConnectionState.active: return ConnectionActive;case ConnectionState.done: return ConnectionDone;}return null; // unreachable}, ),
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
              title: Text('nombre: ${usuario.nombre}'),
            ),
            ListTile(
              title: Text('Edad: ${usuario.edad}'),
            ),
            Text(
              'Profesiones',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text('Profesión 1:'),
            ),
            ListTile(
              title: Text('Profesión 2'),
            ),
          ],
        ),
      ),
    );
  }
}
