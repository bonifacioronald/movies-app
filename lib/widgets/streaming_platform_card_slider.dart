import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/streaming_platform.dart';
import '../providers/streaming_platforms.dart';
import '../widgets/streaming_platform_card_item.dart';

class StreamingPlatformCardSlider extends StatelessWidget {
  const StreamingPlatformCardSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<StreamingPlatform> _streamingPlatformData =
        Provider.of<StreamingPlatforms>(context, listen: false)
            .streamingPlatform;

    return Container(
      height: 120,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _streamingPlatformData.length,
        itemBuilder: (_, index) {
          return Row(
            children: [
              SizedBox(
                width: index == 0 ? 24 : 0,
              ),
              SizedBox(
                width: (index != 0 && index != _streamingPlatformData.length)
                    ? 12
                    : 0,
              ),
              StreamingPlatformCardItem(_streamingPlatformData[index]),
              SizedBox(
                width: index == _streamingPlatformData.length - 1 ? 24 : 0,
              )
            ],
          );
        },
      ),
    );
  }
}
