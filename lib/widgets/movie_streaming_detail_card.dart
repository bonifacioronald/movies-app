import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/colors.dart' as custom_color;
import 'package:movies_app/models/streaming_platform.dart';

class MovieStreamingDetailCard extends StatelessWidget {
  StreamingPlatform streamingData;
  String streamingUrl;

  MovieStreamingDetailCard(this.streamingData, this.streamingUrl);

  late Uri _url = Uri.parse(streamingUrl);
  void _launchUrl() async {
    if (!await launchUrl(_url, mode: LaunchMode.externalApplication))
      throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchUrl,
      child: Container(
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
                        streamingData.logoUrl,
                      ),
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: Text(
                    'Watch on ${streamingData.name}',
                    style: TextStyle(color: Colors.white),
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
