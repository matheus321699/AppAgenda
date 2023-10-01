import 'package:flutter/material.dart';

class ServiceForm extends StatefulWidget {
  final void Function(String, double) onSubmit;
  const ServiceForm(this.onSubmit);

  @override
  State<ServiceForm> createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String nameService;
  late String price;
  
  _submitForm() {
    if (nameService.isEmpty || price.isEmpty) {
      return;
    }
    widget.onSubmit(nameService, double.parse(price));
  }

  @override
  Widget build(BuildContext context) {
    
     return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Serviço'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um serviço';
                        }
                        return null;
                      },
                      onSaved: (value) => nameService = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Valor'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um telefone';
                        }
                        return null;
                      },
                      onSaved: (value) => price = value!,
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Aqui você pode fazer algo com os dados coletados
                        }
                        _submitForm();
                        showDialog(
                            context: context, 
                            builder: (ctx) => AlertDialog(
                              title: Text('Serviço cadastrado :)'),
                            )
                        );
                      },
                      child: Text('Cadastrar serviço'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}