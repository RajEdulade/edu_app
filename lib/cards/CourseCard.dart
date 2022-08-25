import 'package:flutter/material.dart';

import '../constants.dart';
import '../model/course.dart';
class CourseCard extends StatelessWidget {
  CourseCard({
    Key? key, required this.course
  }) : super(key: key);

  Course course;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 240,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        gradient: course.background,
        boxShadow: [
          BoxShadow(
            color: course.background.colors[0].withOpacity(0.3),
            offset: Offset(0, 15),
            blurRadius: 15,
          ),
          BoxShadow(
            color: course.background.colors[1].withOpacity(0.3),
            offset: Offset(0, 15),
            blurRadius: 15,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "${course.courseSubtitle}",
              style: kCardSubtitleStyle,
            ),
            Text(
              "${course.courseTitle}",
              style: kCardTitleStyle,
            ),
            Expanded(
              child: Image.asset("asset/illustrations/${course.illustration}",
              ),
            ),
          ],
        ),
      ),
    );
  }
}