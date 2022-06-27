import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class VolumeSlider extends StatefulWidget {
  const VolumeSlider({Key? key}) : super(key: key);

  @override
  _VolumeSliderState createState() => _VolumeSliderState();
}

class _VolumeSliderState extends State<VolumeSlider> {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: 170,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.volume_up_outlined,
                color: Colors.white,
              ),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: StepProgressIndicator(
                totalSteps: 10,
                currentStep: 3,
                size: 5,
                padding: 0,
                selectedColor: Colors.lightBlueAccent,
                unselectedColor: Colors.white70,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
              child: Icon(
                Icons.volume_down_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
}
