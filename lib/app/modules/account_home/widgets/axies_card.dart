import '../../../models/axies.dart';
import 'package:flutter/material.dart';

class AxieCard extends StatelessWidget {
  final Result _axie;

  AxieCard(this._axie);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              _axie.image,
              height: 150,
            ),
            Text(
              '#${_axie.id}',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            Text(
              _axie.name,
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            Text('Class: ${_axie.resultClass}'),
          ],
        ),
      ),
    );
  }
}
