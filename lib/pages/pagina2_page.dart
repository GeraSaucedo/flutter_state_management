import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management/bloc/usuario/usuario_bloc.dart';
import 'package:state_management/models/usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final newUser = Usuario(edad: 25, nombre: "Jerry", profesiones: ["Flutter dev", "LOL Player"]);
                BlocProvider.of<UsuarioBloc>(context).add(ActivarUsuario(newUser));
              },
              child: Text(
                "Establecer usuario",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                BlocProvider.of<UsuarioBloc>(context).add(CambiarEdad(30));
              },
              child: Text(
                "Cambiar edad",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                 BlocProvider.of<UsuarioBloc>(context).add(AgregarProfesion('Nueva profesion'));
              },
              child: Text(
                "Añadir profesion",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
