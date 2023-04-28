import 'package:calculator_consum/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || isValid == false) {
      return;
    }
    _formKey.currentState!.save();
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Te rog introdu o valoare'),
      duration: Duration(seconds: 2),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataValues, _) => Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
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
                  if (distanta != null && distanta != '') {
                    dataValues.setDistanta(int.parse(distanta));
                  }
                },
                validator: (value) {
                  if (value == null || value == '') {
                    _showSnackbar(context);
                    return;
                  }
                  return null;
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(20)),
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
                  if (consum != null && consum != '') {
                    dataValues.setConsum(int.parse(consum));
                  }
                },
                validator: (value) {
                  if (value == null || value == '') {
                    _showSnackbar(context);
                    return;
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
                          if (pret != null && pret != '') {
                            dataValues.setPret(int.parse(pret));
                          }
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            _showSnackbar(context);
                            return;
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
                onPressed: _saveForm,
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
    );
  }
}
