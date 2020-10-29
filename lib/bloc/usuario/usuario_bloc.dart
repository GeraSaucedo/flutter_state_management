import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:state_management/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(usuario: state.usuario.copyWith(edad: 30));
    } else if (event is AgregarProfesion) {
      List newProfesiones = state.usuario.profesiones;
      newProfesiones.add(event.profesion);

      yield state.copyWith(usuario: state.usuario.copyWith(profesiones: newProfesiones));
    } else if (event is BorrarUsuario) {
      yield state.estadoInicial();
    }
  }
}
