// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormNameAmount extends StatefulWidget {
  final void Function(String, double, DateTime) addTransaction;

  FormNameAmount(this.addTransaction);

  @override
  State<FormNameAmount> createState() => _FormNameAmountState();
}

class _FormNameAmountState extends State<FormNameAmount> {
  final _tittleController = TextEditingController();

  final _valueController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    if (_tittleController.text.isEmpty ||
        double.parse(_valueController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }

    widget.addTransaction(_tittleController.text,
        double.tryParse(_valueController.text) ?? 0.0, _selectedDate);
  }

  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _tittleController,
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: "Titulo"),
            ),
            TextField(
              controller: _valueController,
              onSubmitted: (_) => _submitForm(),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: "Valor (R\$)"),
            ),
            SizedBox(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? "Nenhuma data selecionada"
                        : "Data Selecionada: ${DateFormat("dd/MM/y").format(_selectedDate)}"),
                  ),
                  TextButton(
                    child: Text(
                      "Selecionar data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      _showDatePicker(context);
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                child: Text(
                  "Adicionar",
                ),
                onPressed: _submitForm)
          ],
        ),
      ),
    );
  }
}
