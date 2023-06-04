import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

import '../common/colo_extension.dart';

class NutritionRow extends StatelessWidget {
  final Map nObj;
  const NutritionRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.of(context).size;
      var val = double.tryParse(nObj["value"].toString()) ?? 1;
    var maxVal = double.tryParse(nObj["max_value"].toString()) ?? 1;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(children: [
        Row(
          children: [
            Text(
              nObj["title"].toString(),
              style: TextStyle(
                  color: TColor.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 4,
            ),
            Image.asset(
              nObj["image"].toString(),
              width: 15,
              height: 15,
            ),
            const Spacer(),
            Text(
              "${nObj["value"].toString()} ${nObj["unit_name"].toString()}",
              style: TextStyle(color: TColor.gray, fontSize: 11),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        SimpleAnimationProgressBar(
          height: 10,
          width: media.width - 30,
          backgroundColor: Colors.grey.shade100,
          foregrondColor: Colors.purple,
          ratio: val / maxVal,
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(7.5),
          gradientColor: LinearGradient(
              colors: TColor.primaryG,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ]),
    );
  }
}