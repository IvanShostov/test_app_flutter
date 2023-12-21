import 'package:flutter/material.dart';
import '/colors.dart';

class IndicatorWidget extends StatefulWidget {
  final Map<String, dynamic> data;

  const IndicatorWidget(this.data, {Key? key}) : super(key: key);

  @override
  State<IndicatorWidget> createState() => _IndicatorWidgetState();
}

class _IndicatorWidgetState extends State<IndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final expansionScreen = width >= 400
        ? width <= 429
            ? width * 0.829
            : width * 0.835
        : width >= 350
            ? width >= 380
                ? width * 0.82
                : width * 0.812
            : width * 0.78;

    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.indicatirBackgroundColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var entry in widget.data.entries)
                    FixedWidthText(
                      text: entry.key,
                      number: entry.value['value'].toInt(),
                      color: entry.value['color'],
                    )
                ],
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 10,
                  child: Row(
                    children: [
                      for (var entry in widget.data.entries)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          width: expansionScreen * entry.value['value'] / 100,
                          height: 20,
                          color: entry.value['color'],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FixedWidthText extends StatelessWidget {
  final String text;
  final int number;
  final Color color;
  const FixedWidthText(
      {super.key,
      required this.text,
      required this.number,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FittedBox(
        fit: BoxFit.cover,
        child: Row(
          children: [
            CircleAvatar(
              radius: 4,
              backgroundColor: color,
            ),
            const SizedBox(
              width: 10,
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: SizedBox(
                width: 75,
                child: Text(
                  '$text $number %',
                  style: const TextStyle(
                    color: ColorsApp.textColor,
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
