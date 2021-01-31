import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: InformacionUsuario(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.next_plan_outlined),
        onPressed: (){
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
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
            Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            Divider(),
            ListTile(
              title: Text('nombre:'),
            ),
            ListTile(
              title: Text('nombre:'),
            ),

            Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
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

