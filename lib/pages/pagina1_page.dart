import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/usuario.dart';
import 'package:state_management/services/usuario_service.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 1"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                final usuarioService = Provider.of<UsuarioService>(context, listen: false);
                usuarioService.removerUsuario();
              })
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuarioService.usuario)
          : Center(child: Text("No hay usuario seleccionado")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
        child: Icon(Icons.arrow_right),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "General",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${usuario.edad}"),
          ),
          Text(
            "Profesiones",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...usuario.profesiones.map((profesion) => ListTile(title: Text(profesion),)).toList()
        ],
      ),
    );
  }
}
