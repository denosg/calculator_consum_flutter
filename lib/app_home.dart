import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  var _values = <String, dynamic>{
    'distanta': '',
    'consum': '',
    'pret': '',
  };

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false || isValid == null) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(children: [
        Container(
          margin: const EdgeInsets.only(
            left: 60,
            right: 60,
            top: 50,
            bottom: 10,
          ),
          child: Image.asset('assets/images/fuel_gauge.png'),
        ),
        const Text(
          'Calculator Consum',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(height: 20),
        Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Distanta',
                  ),
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onSaved: (distanta) {
                    if (distanta != null) {
                      _values['distanta'] = distanta;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Te rog introdu o valoare';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Consum',
                  ),
                  textInputAction: TextInputAction.next,
                  onSaved: (consum) {
                    if (consum != null) {
                      _values['consum'] = consum;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Te rog introdu o valoare';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    labelText: 'Pret',
                  ),
                  onSaved: (pret) {
                    if (pret != null) {
                      _values['pret'] = pret;
                    }
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'Te rog introdu o valoare';
                    }
                    return null;
                  },
                ),
              ],
            ))
      ]),
    );
  }
}
