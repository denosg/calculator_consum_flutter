import 'package:calculator_consum/providers/data_provider.dart';
import 'package:calculator_consum/providers/fuel_price_transfer.dart';
import 'package:calculator_consum/providers/fuel_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  DataForm(this.scaffoldKey);

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final _formKey = GlobalKey<FormState>();
  var isGood = false;

  void _saveForm() {
    final isValid = _formKey.currentState?.validate();
    if (isValid == null || isValid == false) {
      Provider.of<FuelPriceTransfer>(context, listen: false).setFuelPrice(null);
      return;
    }
    _formKey.currentState!.save();
    isGood = true;
    Provider.of<DataProvider>(context, listen: false).setGoodStatus(isGood);
  }

  void _showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Te rog introdu o valoare'),
      duration: Duration(seconds: 2),
    ));
  }

  void _openDrawer() {
    widget.scaffoldKey.currentState!.openEndDrawer();
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
                decoration: const InputDecoration(
                  hintText: 'Distanta',
                  border: InputBorder.none,
                ),
                onSaved: (distanta) {
                  if (distanta != null && distanta != '') {
                    dataValues.setDistanta(double.parse(distanta));
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
                    dataValues.setConsum(double.parse(consum));
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
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Consumer<FuelPriceTransfer>(
                      builder: (context, transfer, _) => TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: 'Pret',
                            border: InputBorder.none,
                            hintStyle: TextStyle()),
                        onSaved: (pret) {
                          if (pret != null && pret != '') {
                            dataValues.setPret(double.parse(pret));
                          }
                        },
                        validator: (value) {
                          if (value == null || value == '') {
                            _showSnackbar(context);
                            return;
                          }
                          return null;
                        },
                        controller: TextEditingController(
                          text: transfer.fuelPrice == null
                              ? ''
                              : transfer.fuelPrice.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  // color: Colors.green,
                  child: IconButton(
                    onPressed: _openDrawer,
                    icon: const Icon(
                      Icons.list,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  _saveForm();
                },
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
            ),
          ],
        ),
      ),
    );
  }
}
