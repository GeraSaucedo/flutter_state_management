import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/usuario.dart';
import 'package:state_management/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario ? Text("${usuarioService.usuario.nombre}") : Text("Pagina 2"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                Usuario newUser = new Usuario(
                    edad: 25, nombre: "Jerry", profesiones: ["Full stack developer", "Apex legends Player"]);
                usuarioService.usuario = newUser;
              },
              child: Text(
                "Establecer usuario",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.cambiarEdad(30);
              },
              child: Text(
                "Cambiar edad",
                style: TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.agregarProfesion();
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
