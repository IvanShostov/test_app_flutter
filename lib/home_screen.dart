import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/colors.dart';
import 'values_provider.dart';
import 'indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final valuesProv = Provider.of<ValueProvider>(context);
    return Scaffold(
      backgroundColor: ColorsApp.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Health balance',
                        style: TextStyle(
                            color: ColorsApp.textColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Text(
                            valuesProv.isWeek == true
                                ? 'Last week'
                                : 'Last month',
                            style: const TextStyle(
                                color: ColorsApp.textColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Icon(
                            Icons.swap_horiz,
                            color: ColorsApp.textColor,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                IndicatorWidget(valuesProv.values),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    valuesProv.changeBoolWeek();
                    valuesProv.changeValues();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsApp.buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  'Change Values',
                  style: TextStyle(
                      color: ColorsApp.backgroundColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
