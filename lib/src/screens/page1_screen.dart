import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states_app/src/bloc/usuario/usuario_cubit.dart';
import 'package:flutter_states_app/src/models/Usuario.dart';

class Page1Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pagina1'),
        actions: [
          IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                context.read<UsuarioCubit>().borrarUsuario();
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
      body: BodyScaffold(),
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
            ...usuario.profesiones
                .map((e) => ListTile(
                      title: Text('Profesión: $e'),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (BuildContext context, UsuarioState state) {
        print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(
              child: Text('Usuario sin información'),
            );
            break;
          case UsuarioActivo:
            return InformacionUsuario((state as UsuarioActivo).usuario);
            break;
          default:
            return CircularProgressIndicator();
        }

        // if (state is UsuarioInitial) {
        //   return Center(
        //     child: Text('Usuario sin información'),
        //   );
        // } else if (state is UsuarioActivo) {
        //   return InformacionUsuario(state.usuario);
        // }
        // return CircularProgressIndicator();
      },
    );
  }
}
