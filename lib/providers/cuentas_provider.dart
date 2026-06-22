import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class CuentasProvider extends ChangeNotifier{

  final _url = "https://gqwzqeiitmqyprirhtgj.supabase.co/rest/v1/cuentas";
  final _apikey = "sb_publishable_IhSnQyP4ZDdcMir4b501rw_37D2mLSh";

  
  Future<void> enviarDatos(String plataforma, String cuenta, String password)async{
    try{
      final url = Uri.parse(_url);
      final respuesta = await http.post(
        url,
        headers: {
          "Content-Type":"application/json",
          "apikey": _apikey
        },
        body: jsonEncode({
          "plataforma":plataforma,
           "cuenta":cuenta,
           "password":password
      })
      );
      if(respuesta.statusCode==200 || respuesta.statusCode==201){
        print("Dato enviado correctamente");
        await obtenerDatos();
      }else{
        print("Error interno");
      }
    }catch(e){
      print("Error de conexión");
    }
  }

  List datosObtenidos = [];
  Future<void> obtenerDatos()async{
    try{
      final url = Uri.parse(_url);
      final respuesta = await http.get(
        url,
        headers: {
          "Content-Type":"application/json",
          "apikey": _apikey
        },
      );
      if(respuesta.statusCode==200 || respuesta.statusCode==201){
        print("obtenido correctamente");
        final prueba = jsonDecode(respuesta.body);
        print(prueba.runtimeType);
        datosObtenidos = prueba;
        notifyListeners();
      }else{
        print("Error interno");
      }
    }catch(e){
      print("Error de conexión");
    }
  }

  Future<void> eliminarDato(String id)async{
    try{
      final url = Uri.parse("$_url?id=eq.$id");
      final respuesta = await http.get(
        url,
        headers: {
          "Content-Type":"application/json",
          "apikey": _apikey
        },
      );
      if(respuesta.statusCode==200 || respuesta.statusCode==201){
        print("obtenido correctamente");
        final prueba = jsonDecode(respuesta.body);
        print(prueba.runtimeType);
        datosObtenidos = prueba;
        notifyListeners();
      }else{
        print("Error interno");
      }
    }catch(e){
      print("Error de conexión");
    }
  }
  
}