import 'package:flutter/material.dart';

class MyStepperDemo extends StatefulWidget {
  @override
  _MyStepperDemoState createState() => _MyStepperDemoState();
}

class _MyStepperDemoState extends State<MyStepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Stepper Example'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        controlsBuilder: (BuildContext context, ControlsDetails controls) {
          return Row(
            children: <Widget>[
              TextButton(
                onPressed: controls.onStepContinue,
                child: const Text('下一步'),
              ),
              TextButton(
                onPressed: controls.onStepCancel,
                child: const Text('離開'),
              ),
            ],
          );
        },
        steps: [
          Step(
            title: Text(''),
            content: Text('This is the content of Step 1.'),
            isActive: _currentStep >= 0,
          ),
          Step(
            title: Text(''),
            content: Text('This is the content of Step 2.'),
            isActive: _currentStep >= 1,
          ),
          Step(
            title: Text(''),
            content: Text('This is the content of Step 3.'),
            isActive: _currentStep >= 2,
          ),
        ],
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
      ),
    );
  }
}
