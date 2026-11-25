import 'package:flutter/material.dart';
//import 'screen/screen_promedio.dart';
//import 'screen/screen_trabajador.dart';
//import 'screen/screen_descuento.dart';
//import 'screen/screen_comision.dart';
import 'screen/screen_formulario.dart';
import 'screen/screen_frmnombre.dart';
import 'screen/screen_frmcorreo.dart';
import 'screen/screen_frmedad.dart';
import 'screen/screen_frmdni.dart';
import 'screen/screen_frmpassword.dart';
import 'screen/screen_frmestudiante.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: ScreenPromedio(),
      //home: ScreenTrabajador(),
      //home: ScreenDescuento(),
      //home: ScreenComision(),
      //home: ScreenFormulario(),
      //home: ScreenFrmnombre(),

      home: ScreenFrmcorreo(),
      //home: ScreenFrmedad(),
      //home: ScreenFrmdni(),
      //home: ScreenFrmpassword(),
      //home: ScreenFrmestudiante(),
    );
  }
}