import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionalForm extends StatefulWidget {
  final void Function(String, String, DateTime, TimeOfDay) onSubmit;
  const TransactionalForm(this.onSubmit);

  @override
  State<TransactionalForm> createState() => _TransactionalFormState();
}

class _TransactionalFormState extends State<TransactionalForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String name;
  late String phone;
  late DateTime selectedDate;
  late TimeOfDay selectedTime;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    selectedTime = TimeOfDay.now();
  }

  _submitForm() {
    if (name.isEmpty || phone.isEmpty) {
      return;
    }

    widget.onSubmit(name, phone, selectedDate, selectedTime);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2024),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
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
                      decoration: InputDecoration(labelText: 'Nome'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome';
                        }
                        return null;
                      },
                      onSaved: (value) => name = value!,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Telefone'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um telefone';
                        }
                        return null;
                      },
                      onSaved: (value) => phone = value!,
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                            'Data selecionada: ${DateFormat('dd/MM/yyyy', 'pt_BR').format(selectedDate)}'),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Selecionar Data'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                            'Horário selecionado: ${selectedTime.format(context)}'),
                        SizedBox(width: 20),
                        TextButton(
                          onPressed: () => _selectTime(context),
                          child: Text('Selecionar Horário'),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Aqui você pode fazer algo com os dados coletados
                          print('Nome: $name');
                          print('Telefone: $phone');
                          print('Data selecionada: $selectedDate');
                          print('Horário selecionado: $selectedTime');
                        }
                        _submitForm();
                        showDialog(
                            context: context, 
                            builder: (ctx) => AlertDialog(
                              title: Text('Agendamento efetuado com sucesso :)'),
                            )
                        );
                      },
                      child: Text('Agendar'),
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
