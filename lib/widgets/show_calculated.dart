import 'package:flutter/material.dart';

class ShowCalculated extends StatelessWidget {
  final double? distanta;
  final double? consum;
  final double? price;

  double? litriiConsumati;
  double? costTraseu;

  ShowCalculated({
    required this.distanta,
    required this.consum,
    required this.price,
  });

  void calculareConsum() {
    litriiConsumati = (distanta! * consum!) / 100;
    costTraseu = (litriiConsumati! * price!);
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
