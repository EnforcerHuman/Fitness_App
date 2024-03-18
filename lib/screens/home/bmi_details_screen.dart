import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';

class BmiDetailsScreen extends StatelessWidget {
  const BmiDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: media.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: Tcolor.secondryGradient)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) => LinearGradient(
                          colors: Tcolor.primaryGradient,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ).createShader(bounds),
                        child: const Text(
                          'What is BMI',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      const Text(
                          '*BMI stands for Body Mass Index.\n\n *It is a measure that uses an individuals height and weight to determine whether they are underweight, normal weight, overweight, or obese.\n\n *BMI is calculated by dividing a persons weight in kilograms by the square of their height in meters')
                    ],
                  ),
                  SizedBox(
                    height: media.height * 0.03,
                  ),
                  const Text(
                    'The result of this calculation provides a numerical value, which falls into one of the following categories:',
                    style: TextStyle(
                        color: Color.fromARGB(255, 4, 80, 143), fontSize: 10),
                  ),
                  SizedBox(
                    height: media.height * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Underweight : BMI less than 18.5',
                        style:
                            TextStyle(color: Color.fromARGB(255, 93, 172, 236)),
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      const Text(
                        'Normalweight : BMI between 18.5 and 24.9',
                        style: TextStyle(color: Colors.green),
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      const Text(
                        'Overweight : BMI between 20 and 29.9',
                        style: TextStyle(color: Colors.orange),
                      ),
                      SizedBox(
                        height: media.height * 0.02,
                      ),
                      const Text(
                        'Obese : BMI 30 or greater',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
