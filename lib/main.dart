import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_states_app/src/bloc/usuario/usuario_bloc.dart';
import 'package:flutter_states_app/src/screens/page1_screen.dart';
import 'package:flutter_states_app/src/screens/page2_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UsuarioBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Page1Screen(),
          'pagina2': (_) => Page2Screen(),
        },
      ),
    );
  }
}
