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
      body: SingleChildScrollView(
        child: Column(children: [
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
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            height: 310,
            // color: Colors.red,
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Distanta',
                        border: InputBorder.none,
                      ),
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
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      autocorrect: false,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      decoration: const InputDecoration(
                          hintText: 'Consum',
                          border: InputBorder.none,
                          hintStyle: TextStyle()),
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
                  ),
                  Container(
                    // color: Colors.amber,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFormField(
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              autocorrect: false,
                              textInputAction: TextInputAction.next,
                              autofocus: true,
                              decoration: const InputDecoration(
                                  hintText: 'Pret',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle()),
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
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          // color: Colors.green,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.list,
                              color: Colors.grey,
                              size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text(
                        'CALCULEAZA',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
