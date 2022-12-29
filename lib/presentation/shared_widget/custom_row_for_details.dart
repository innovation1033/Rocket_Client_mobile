import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomRowForDetails extends StatelessWidget {
  final String text1;
  final String text2;

  const CustomRowForDetails({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              children: [
                const Icon(Icons.check_circle_outline),
                Text(
                  text1,
                ),
              ],
            ),
          ),
        ),
        Row(
          children: [
            const Text(":"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: SizedBox(
                width: 20.w,
                child: Text(
                  text2,maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}