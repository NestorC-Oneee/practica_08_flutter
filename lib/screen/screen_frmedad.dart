import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenFrmedad extends StatefulWidget {
  const ScreenFrmedad({super.key});

  @override
  State<ScreenFrmedad> createState() => _ScreenFrmedadState();
}

class _ScreenFrmedadState extends State<ScreenFrmedad> {
  final _formKey = GlobalKey<FormState>();
  final _edadController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Edad registrada correctamente')),
      );
    }
  }

  @override
  void dispose() {
    _edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Edad')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _edadController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Edad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La edad es obligatoria';
                  }
                  int? edad = int.tryParse(value);
                  if (edad == null || edad < 18) {
                    return 'Debe ser mayor o igual a 18 años';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: registrar,
                child: const Text('REGISTRAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}