import 'package:flutter/material.dart';

class StatefulBubuttons extends StatefulWidget {
  const StatefulBubuttons({super.key});

  @override
  State<StatefulBubuttons> createState() => _StatefulBubuttonsState();
}

enum PaymentType { cash, installment, any }

class _StatefulBubuttonsState extends State<StatefulBubuttons> {
  bool? checkboxValue = false;

  List<String> genders = ['Male', 'Female'];
  String gender = 'Male';
  int _radioVal = 0;
  PaymentType _selectedPaymentType = PaymentType.cash;
  bool swichValue = false;
  double sliderValue = 0.2;
  double progressValue = 0.2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Buttons'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: checkboxValue ?? false,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value ?? false;
                  });
                },
              ),
              Checkbox(
                value: checkboxValue,
                onChanged: (value) {
                  setState(() {
                    checkboxValue = value;
                  });
                },
                checkColor: Colors.black,
                activeColor: Colors.red,
                shape: const CircleBorder(side: BorderSide(color: Colors.black)),
                tristate: true,
              ),
              Checkbox(
                value: checkboxValue ?? false,
                onChanged: null,
              ),
              Row(
                children: <Widget>[
                  Radio<String>(
                    value: genders.first,
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text('Male'),
                  Radio<String>(
                    value: genders.last,
                    groupValue: gender,
                    onChanged: (String? value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  const Text('Female'),
                ],
              ),
              Column(
                children: paymentMethods
                    .map((e) => RadioListTile(
                        title: Text(e.name),
                        value: e,
                        groupValue: _selectedPaymentMethod,
                        onChanged: (e) {
                          setState(() {
                            _selectedPaymentMethod = e;
                          });
                        }))
                    .toList(),
              ),
              Row(
                children: [0, 1, 2, 3]
                    .map(
                      (int index) => Radio<int>(
                        value: index,
                        groupValue: _radioVal,
                        onChanged: (int? value) {
                          if (value != null) {
                            setState(() => _radioVal = value);
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Radio<PaymentType>(
                          value: PaymentType.cash,
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentType = value!;
                            });
                          }),
                      Text(PaymentType.cash.name),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<PaymentType>(
                          value: PaymentType.installment,
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentType = value!;
                            });
                          }),
                      Text(PaymentType.installment.name),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<PaymentType>(
                          value: PaymentType.any,
                          groupValue: _selectedPaymentType,
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentType = value!;
                            });
                          }),
                      Text(PaymentType.any.name),
                    ],
                  )
                ],
              ),
              const Divider(),
              Switch(
                activeColor: Colors.red,
                value: swichValue,
                onChanged: (value) {
                  setState(() {
                    swichValue = value;
                  });
                },
              ),
              Slider(
                value: sliderValue,
                label: sliderValue.toString(),
                inactiveColor: Colors.red,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              Slider(
                value: sliderValue,
                divisions: 5,
                label: (sliderValue * 10).toString(),
                onChanged: (value) {
                  print(value);
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              const LinearProgressIndicator(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              CircularProgressIndicator(
                value: progressValue,
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (progressValue >= 1.0) {
                        progressValue = 0.0;
                      }
                      progressValue += 0.2;
                    });
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }

  final List<PaymentMethod> paymentMethods = [
    PaymentMethod('Credit Card'),
    PaymentMethod('Debit Card'),
    PaymentMethod('PayPal'),
    PaymentMethod('Cash on Delivery'),
  ];
  PaymentMethod? _selectedPaymentMethod;
}

class PaymentMethod {
  final String name;

  PaymentMethod(this.name);
}
