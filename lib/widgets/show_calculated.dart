import 'package:flutter/material.dart';

class ShowCalculated extends StatefulWidget {
  final double? distanta;
  final double? consum;
  final double? price;

  ShowCalculated({
    super.key,
    required this.distanta,
    required this.consum,
    required this.price,
  });

  @override
  State<ShowCalculated> createState() => _ShowCalculatedState();
}

class _ShowCalculatedState extends State<ShowCalculated> {
  double? litriiConsumati;

  double? costTraseu;

  void calculareConsum() {
    litriiConsumati = (widget.distanta! * widget.consum!) / 100;
    costTraseu = (litriiConsumati! * widget.price!);
  }

  @override
  Widget build(BuildContext context) {
    calculareConsum();
    return Column(
      children: [
        Text(
          'Ati consumat: ${litriiConsumati!.toStringAsFixed(2)} litrii',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Cost traseu: ${costTraseu!.toStringAsFixed(2)} lei',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
