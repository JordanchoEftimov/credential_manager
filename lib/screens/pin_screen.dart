import 'package:credential_manager/widgets/pin_circle.dart';
import 'package:flutter/material.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String enteredPin = '';

  void _clickNumPadButton(String val) {
    if (enteredPin.length >= 4) return;
    setState(() {
      enteredPin += val;
    });
  }

  void _deleteFromPin() {
    if (enteredPin.isEmpty) return;
    setState(() {
      enteredPin = enteredPin.substring(0, enteredPin.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Authenticate'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const Text(
                'Please enter your Pin:',
                style: TextStyle(fontSize: 22),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(
                  4,
                  (i) => PinCircle(
                    fillCircle: enteredPin.length - i > 0,
                  ),
                ),
              ),
            ],
          ),
          Column(children: [
            ...List<Row>.generate(3, (i) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List<OutlinedButton>.generate(3, (j) {
                  String val = (3 * i + j + 1).toString();
                  return OutlinedButton(
                    onPressed: () => _clickNumPadButton(val),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: Text(
                      val,
                      style: const TextStyle(fontSize: 25),
                    ),
                  );
                }),
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                    child: const Icon(Icons.check)),
                OutlinedButton(
                  onPressed: () => _clickNumPadButton("0"),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                OutlinedButton(
                  onPressed: () => _deleteFromPin(),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                  ),
                  child: const Icon(
                    Icons.backspace,
                  ),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
