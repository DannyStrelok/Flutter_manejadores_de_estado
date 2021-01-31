import 'package:flutter/material.dart';

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
              onPressed: (){},
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Establecer usuario'),
            ),
            MaterialButton(
              onPressed: (){},
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
