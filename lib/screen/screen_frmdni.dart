import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenFrmdni extends StatefulWidget {
  const ScreenFrmdni({super.key});

  @override
  State<ScreenFrmdni> createState() => _ScreenFrmdniState();
}

class _ScreenFrmdniState extends State<ScreenFrmdni> {
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('DNI registrado correctamente')),
      );
    }
  }

  @override
  void dispose() {
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de DNI')),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: _dniController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(labelText: 'Número de DNI'),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 8) {
                    return 'DNI incorrecto';
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