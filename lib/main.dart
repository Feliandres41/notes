import 'package:flutter/material.dart';
import 'package:passwords/providers/cuentas_provider.dart';
import 'package:provider/provider.dart';
import 'routers/routers.dart';

void main(){
  runApp(consumerProvider());
}

class consumerProvider extends StatelessWidget{
  const consumerProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>CuentasProvider())
    ],child: Myapp(),);
  }
}

class Myapp extends StatelessWidget{
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: Routers.rutas,
      theme: ThemeData.light().copyWith(
        appBarTheme: AppBarThemeData(
          backgroundColor: Colors.black,
          
        )
      ),
    );
  }
}