import 'package:flutter/material.dart';

class ScreenFrmnombre extends StatefulWidget {
  const ScreenFrmnombre({super.key});

  @override
  State<ScreenFrmnombre> createState() => _ScreenFrmnombreState();
}

class _ScreenFrmnombreState extends State<ScreenFrmnombre> {
  // controladores de los campos
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();


  void registrar() {
    if (_formKey.currentState!.validate()) {
      // Aquí puedes realizar la acción de registro, como enviar los datos a un servidor
      String nombre = _nombreController.text;


      // Por ejemplo, mostrar un mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registro exitoso: $nombre')),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Formulario')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa tu nombre';
                  }
                  return null;
                },
              ),
              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrar,
                child: const Text('Registrar'),
              ),
            ],
          ),
        )
      )
    );
  }
}