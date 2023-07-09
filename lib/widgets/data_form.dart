import 'package:calculator_consum/providers/data_provider.dart';
import 'package:calculator_consum/providers/fuel_price_transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const DataForm(this.scaffoldKey, {super.key});

  @override
  State<DataForm> createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  var fuelPriceController = TextEditingController(text: '');
  final _formKey = GlobalKey<FormState>();
  var isGood = false;

  void _saveForm(BuildContext context) {
    final isValid = _formKey.currentState?.validate();
    if (isValid == false) {
      _showSnackbar(context);
      Provider.of<FuelPriceTransfer>(context, listen: false).setFuelPrice(null);
      return;
    }
    _formKey.currentState!.save();
    isGood = true;
    Provider.of<FuelPriceTransfer>(context, listen: false).setFuelPrice(null);
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
            LimitedBox(
              maxHeight: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
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
                    if (distanta != null && distanta.isNotEmpty) {
                      dataValues.setDistanta(double.parse(distanta));
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            LimitedBox(
              maxHeight: 55,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    hintText: 'Consum',
                    border: InputBorder.none,
                    hintStyle: TextStyle(),
                  ),
                  onSaved: (consum) {
                    if (consum != null && consum.isNotEmpty) {
                      dataValues.setConsum(double.parse(consum));
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: LimitedBox(
                    maxHeight: 55,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Consumer<FuelPriceTransfer>(
                        builder: (context, transfer, _) => TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: 'Pret',
                            border: InputBorder.none,
                            hintStyle: TextStyle(),
                          ),
                          onSaved: (pret) {
                            if (pret != null && pret.isNotEmpty) {
                              dataValues.setPret(double.parse(pret));
                              fuelPriceController.text = pret;
                            }
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return '';
                            }
                            return null;
                          },
                          controller: TextEditingController(
                            text: transfer.fuelPrice == null
                                ? fuelPriceController.text
                                : transfer.fuelPrice.toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    onPressed: _openDrawer,
                    icon: const Icon(
                      Icons.list,
                      color: Colors.grey,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => _saveForm(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
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
