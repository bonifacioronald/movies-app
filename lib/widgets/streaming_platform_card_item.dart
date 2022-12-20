import 'package:flutter/material.dart';

import '../models/colors.dart' as custom_color;
import 'package:movies_app/models/streaming_platform.dart';

class StreamingPlatformCardItem extends StatelessWidget {
  StreamingPlatform streamingPlatformData;

  StreamingPlatformCardItem(this.streamingPlatformData);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 120,
      decoration: BoxDecoration(
          color: custom_color.backgroundAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.white.withOpacity(0.1))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, right: 24, bottom: 24, top: 12),
                    child: Image.asset(
                      streamingPlatformData.logoUrl,
                    ),
                  ),
                ),
                flex: 3,
              ),
              Expanded(
                child: Text(
                  streamingPlatformData.totalCountries > 1
                      ? 'Supported in ${streamingPlatformData.totalCountries} countries'
                      : 'Supported in ${streamingPlatformData.totalCountries} country',
                  style: TextStyle(color: Colors.white),
                ),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
