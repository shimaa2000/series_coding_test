import 'package:coding_test/training_series/presentation/components/read_more_widget.dart';
import 'package:coding_test/training_series/presentation/components/video_view.dart';
import 'package:flutter/material.dart';

import '../../domain/entity/series.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    Key? key,
    required this.series,
  }) : super(key: key);
  final Series series;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
      height:  MediaQuery.sizeOf(context).height ,
        child: Column(
          children: [
            Text(
              'ABOUT THIS SERIES',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.sizeOf(context).width * .06,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ReadMoreWidget(
              text: series.description,
            ),
            VideoView(
              url: series.overviewVideoUrl,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                color: Colors.grey.withOpacity(.5),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(series.instructorInfo.imageUrl),
                        ),
                        Column(
                          children: [
                            Text(
                              series.instructorInfo.jobTitle,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: MediaQuery.sizeOf(context).width * .05,
                              ),
                            ),
                            Text(
                              series.instructorInfo.name,
                              style: TextStyle(
                                fontSize: MediaQuery.sizeOf(context).width * .04,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ReadMoreWidget(
                      text: series.instructorInfo.about,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'TOTAL RUN TIME',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                fontSize: MediaQuery.sizeOf(context).width * .05,
              ),
            ),
            Text(
              Duration(seconds: series.totalRunTime).toString(),
              style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width * .03,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Difficulty'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: MediaQuery.sizeOf(context).width * .06,
                        ),
                      ),
                      Text(
                        series.difficulty.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.sizeOf(context).width * .04,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'intensity'.toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: MediaQuery.sizeOf(context).width * .05,
                        ),
                      ),
                      Text(
                        series.intensity,
                        style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width * .03,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'classes'.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: MediaQuery.sizeOf(context).width * .06,
              ),
            ),
        Expanded(child: ListView.builder(itemBuilder: (context, index) => VideoView(url: series.classes[index].videoUrl),))

          ],
        ),
      ),
    );
  }
}
