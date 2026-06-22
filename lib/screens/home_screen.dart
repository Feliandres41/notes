import 'dart:async';

import 'package:flutter/material.dart';
import 'package:passwords/providers/cuentas_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //cuentas a agregar
  final _plataforma = TextEditingController();
  final _cuenta = TextEditingController();
  final _password = TextEditingController();

  final _clave = TextEditingController();
  @override
  void initState(){
    super.initState;
    Provider.of<CuentasProvider>(context,listen: false).obtenerDatos();
    Timer.periodic(Duration(seconds: 1), (timer) => Provider.of<CuentasProvider>(context,listen: false).obtenerDatos());
  }
  
  @override
  Widget build(BuildContext context) {
    final clave = "5204";
    final ancho = MediaQuery.of(context).size.width;
    final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Provider.of<CuentasProvider>(context,listen: false).obtenerDatos();
        }, icon: Icon(Icons.change_circle_outlined,color: Colors.white,)),
        centerTitle: true,
        title: Text("Cuentas",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: ancho*0.05
        ),),
        actions: [
          IconButton(onPressed: () {
            showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                backgroundColor: const Color.fromARGB(197, 2, 44, 78),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SizedBox(
                  width: ancho * 0.8,
                  height: alto * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Confirmar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: ancho*0.5,
                          child: Expanded(
                            child: 
                            TextField(
                              onTapOutside: (event) => FocusScope.of(context).unfocus(),
                              controller: _clave,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),

                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.white)
                                ),
                                hint: Center(
                                  child: Text("Ingrese la clave",style: TextStyle(
                                    color: Colors.white
                                  ),),
                                ),

                              ),
                              style: TextStyle(
                                color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                              obscureText: true,
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancelar",style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: ancho*0.05
                              ),),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                // print("Aceptado");
                                // Navigator.pop(context);
                                if(_clave.text==clave){
                                  print("correcto");
                                  Navigator.pop(context);
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor: const Color.fromARGB(197, 2, 44, 78),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        child: SizedBox(
                                          width: ancho * 0.8,
                                          height: alto * 0.5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  "Agregar una nueva cuenta",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),

                                                TextField(
                                                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                  controller: _plataforma,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      
                                                    ),
                                                    disabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),

                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.white)
                                                    ),
                                                    hint: Center(
                                                      child: Text("Nombre de la plataforma",style: TextStyle(
                                                        color: Colors.white
                                                      ),),
                                                    ),

                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                TextField(
                                                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                  controller: _cuenta,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      
                                                    ),
                                                    disabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),

                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.white)
                                                    ),
                                                    hint: Center(
                                                      child: Text("Correo de la cuenta",style: TextStyle(
                                                        color: Colors.white
                                                      ),),
                                                    ),

                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                TextField(
                                                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                  controller: _password,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      
                                                    ),
                                                    disabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),

                                                    ),
                                                    enabledBorder: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10),
                                                      borderSide: BorderSide(color: Colors.white)
                                                    ),
                                                    hint: Center(
                                                      child: Text("Contraseña",style: TextStyle(
                                                        color: Colors.white
                                                      ),),
                                                    ),

                                                  ),
                                                  style: TextStyle(
                                                    color: Colors.white
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                      ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.red,
                                                      ),
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Cancelar",style: TextStyle(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        fontSize: ancho*0.05
                                                      ),),
                                                    ),

                                                    ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.green,
                                                      ),
                                                      onPressed: () {
                                                        _clave.clear();
                                                        // Navigator.pop(context);
                                                        Provider.of<CuentasProvider>(context,listen: false).enviarDatos(_plataforma.text, _cuenta.text, _password.text);
                                                        _plataforma.clear();
                                                        _cuenta.clear();
                                                        _password.clear();
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Aceptar",style: TextStyle(
                                                        color: Color.fromARGB(255, 255, 255, 255),
                                                        fontSize: ancho*0.05
                                                      ),),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }else{
                                  _clave.clear();
                                }
                              },
                              child: Text("Aceptar",style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: ancho*0.05,
                              ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
          }, icon: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100)
            ),
            child: Icon(Icons.add,color: Colors.black,))
            )
        ],
      ),
      body: Consumer<CuentasProvider>(builder: (context, value, child) {
        final datos = value.datosObtenidos;
        print("${datos.length}");
        return 
        datos.isEmpty
        ? Center(
          child: CircularProgressIndicator(
            color: Colors.black,
          ),
        )
        : Padding(
          padding: EdgeInsets.only(top: alto*0.01),
          child: ListView.builder(
            itemBuilder: (context, index) {
              final dato = datos[index];
              return Container(
                height: alto*0.13,
                margin: EdgeInsets.symmetric(
                  horizontal: ancho*0.08,
                  vertical: alto*0.015,
                ),
                child: Card(
                  color: 
                  dato["plataforma"]=="disney" || dato["plataforma"]=="Disney"
                  ?Colors.blue
                  : dato["plataforma"]=="netflix" || dato["plataforma"]=="Netflix"
                  ? Colors.black
                  : dato["plataforma"]=="gmail" || dato["plataforma"]=="Gmail"
                  ?Colors.green
                  : Colors.teal,
                  elevation: 5,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${dato["plataforma"]}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ancho * 0.04,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${dato["cuenta"]}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ancho * 0.025,
                                fontWeight: FontWeight.bold,
                              ),),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: ancho*0.01,
                            children: [
                              Text("Acciones",style: TextStyle(
                                fontSize: ancho*0.04,
                                fontWeight: FontWeight.bold
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: ancho*0.015,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(context: context, 
                                      builder: (context) => Center(
                                        child: Container(
                                          width: ancho*0.8,
                                          height: alto*0.5,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(197, 2, 44, 78),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: Column(
                                            spacing: alto*0.025,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(top: alto*0.02),
                                                child: Text("Nombre de la plataforma",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700
                                                ),),
                                              ),
                                              Text("${dato["plataforma"]}",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400
                                                ),
                                              ),
                                              Divider(),
                                              Text("Correo electronico",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700
                                                ),
                                              ),
                                              Text("${dato["cuenta"]}",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400
                                                ),
                                              ),
                                              Divider(),
                                              Text("Contraseña",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700
                                                ),
                                              ),
                                              Text("${dato["password"]}",style: 
                                                TextStyle(
                                                  fontSize: ancho*0.06,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),);
                                    },
                                    // child: Text("ver",style: TextStyle(
                                    //   color: const Color.fromARGB(255, 2, 44, 78),
                                    //   fontWeight: FontWeight.bold,
                                    //   fontSize: ancho*0.06
                                    // ),textAlign: TextAlign.center,),
                                    child: Icon(Icons.remove_red_eye,
                                    color: const Color.fromARGB(255, 17, 57, 73),
                                    size: ancho*0.06,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      value.eliminarDato(dato["id"]);
                                    },
                                    child: Icon(
                                      Icons.remove_circle_outline_sharp,color: Colors.red,),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _plataforma.text = dato["plataforma"];
                                      _cuenta.text = dato["cuenta"];
                                      _password.text = dato["password"];
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            backgroundColor: const Color.fromARGB(197, 2, 44, 78),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16),
                                            ),
                                            child: SizedBox(
                                              width: ancho * 0.8,
                                              height: alto * 0.5,
                                              child: Padding(
                                                padding: const EdgeInsets.all(16),
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "Agregar una nueva cuenta",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 22,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),

                                                    TextField(
                                                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                      controller: _plataforma,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          
                                                        ),
                                                        disabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),

                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          borderSide: BorderSide(color: Colors.white)
                                                        ),
                                                        hint: Center(
                                                          child: Text("Nombre de la plataforma",style: TextStyle(
                                                            color: Colors.white
                                                          ),),
                                                        ),

                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    TextField(
                                                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                      controller: _cuenta,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          
                                                        ),
                                                        disabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),

                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          borderSide: BorderSide(color: Colors.white)
                                                        ),
                                                        hint: Center(
                                                          child: Text("Correo de la cuenta",style: TextStyle(
                                                            color: Colors.white
                                                          ),),
                                                        ),

                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    TextField(
                                                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                                                      controller: _password,
                                                      decoration: InputDecoration(
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          
                                                        ),
                                                        disabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),

                                                        ),
                                                        enabledBorder: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(10),
                                                          borderSide: BorderSide(color: Colors.white)
                                                        ),
                                                        hint: Center(
                                                          child: Text("Contraseña",style: TextStyle(
                                                            color: Colors.white
                                                          ),),
                                                        ),

                                                      ),
                                                      style: TextStyle(
                                                        color: Colors.white
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),

                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                          ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.red,
                                                          ),
                                                          onPressed: () {
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("Cancelar",style: TextStyle(
                                                            color: Color.fromARGB(255, 255, 255, 255),
                                                            fontSize: ancho*0.05
                                                          ),),
                                                        ),

                                                        ElevatedButton(
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: Colors.green,
                                                          ),
                                                          onPressed: () {
                                                            _clave.clear();
                                                            // Navigator.pop(context);
                                                            Provider.of<CuentasProvider>(context,listen: false).editarDato(dato["id"],_plataforma.text, _cuenta.text, _password.text);
                                                            _plataforma.clear();
                                                            _cuenta.clear();
                                                            _password.clear();
                                                            Navigator.pop(context);
                                                          },
                                                          child: Text("Aceptar",style: TextStyle(
                                                            color: Color.fromARGB(255, 255, 255, 255),
                                                            fontSize: ancho*0.05
                                                          ),),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Icon(
                                      Icons.edit,color: Colors.amberAccent,
                                    ),
                                  )
                                ],
                              ),
                              // Icon(Icons.remove_red_eye)
                            ],
                          ),
                        ),
                      ],
                    )
                  ),
                ),
              );
            },
            itemCount: datos.length,
          ),
        );
      },),
    );
  }
}