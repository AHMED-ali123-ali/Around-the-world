import 'package:flutter/material.dart';

import 'body.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'images/countries.jpg',
              fit: BoxFit.cover,
            ),
          ),



          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(42.0),
              child: ElevatedButton(
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
                   return CountryPage();
                 }));


                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity,70),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}