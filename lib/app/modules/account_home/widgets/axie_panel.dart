import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/axies.dart';
import 'axies_card.dart';

class AxiePanel extends StatelessWidget {
  final ScrollController controller;
  final List<Result> axieList;
  final int total;

  AxiePanel({
    Key? key,
    required this.controller,
    required this.axieList,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _fetchList() {
      List<Widget> _listWidget = [
        SizedBox(
          height: 12,
        ),
        buildDragHandle(),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            'Axies',
            style:
                GoogleFonts.openSans(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        Center(
          child: Text(
            'Total: $total',
            style:
                GoogleFonts.openSans(fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ];

      for (var axie in axieList) {
        _listWidget.add(AxieCard(axie));
      }

      return _listWidget;
    }

    return ListView(
      controller: controller,
      shrinkWrap: true,
      children: _fetchList(),
    );
  }

  Widget buildDragHandle() => Center(
        child: Container(
          width: 30,
          height: 5,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );
}
