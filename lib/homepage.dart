import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smarthomeui/smartDevicebox.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List mydevices = [
    ['Smart Light', 'assets/light-bulb.png', true],
    ['Smart TV', 'assets/smart-tv.png', false],
    ['Smart AC', 'assets/air-conditioner.png', true],
    ['Smart Fan', 'assets/fan.png', false]
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mydevices[index][2] = value; //change the boolean value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/menu.png',
                height: 35,
                color: Colors.grey.shade800,
              ),
              Icon(
                Icons.person,
                size: 35,
                color: Colors.grey.shade800,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Welcome Home,',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
            Text(
              'Taran Kalirao',
              style: GoogleFonts.teko(fontSize: 50),
            ),
          ]),
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Smart Devices',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Expanded(
            child: GridView.builder(
                itemCount: mydevices.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1 / 1.1, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return SmartDeviceBox(
                    smartDeviceName: mydevices[index][0],
                    iconPath: mydevices[index][1],
                    powerOn: mydevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                }))
      ]),
    );
  }
}
