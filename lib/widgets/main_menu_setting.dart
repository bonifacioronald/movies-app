import 'package:flutter/material.dart';
import 'package:movies_app/models/streaming_platform.dart';
import 'package:movies_app/providers/streaming_platforms.dart';
import 'package:provider/provider.dart';
import '../models/colors.dart' as custom_color;

class MainMenuSetting extends StatefulWidget {
  @override
  State<MainMenuSetting> createState() => _MainMenuSettingState();
  String? selectedStreamingPlatformName;
}

class _MainMenuSettingState extends State<MainMenuSetting> {
  @override
  Widget build(BuildContext context) {
    List<StreamingPlatform> _streamingPlatformList =
        Provider.of<StreamingPlatforms>(context).streamingPlatform;

    widget.selectedStreamingPlatformName =
        Provider.of<StreamingPlatforms>(context)
            .selectedStreamingPlatform
            ?.name;

    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        color: custom_color.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 5,
              width: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings & Preferences',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Your Streaming Platform',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14)),
                    Container(
                      width: 120,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: custom_color.backgroundPrimary,
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          menuMaxHeight: 200,
                          hint: Text(
                            'select',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          value: widget.selectedStreamingPlatformName,
                          items: _streamingPlatformList
                              .map((singleStreamingPLatform) {
                            return DropdownMenuItem(
                              value: singleStreamingPLatform.name,
                              child: Text(
                                singleStreamingPLatform.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) => setState(() {
                            Provider.of<StreamingPlatforms>(context,
                                    listen: false)
                                .setNewSelectedSteamingPlatformByName(value);
                            widget.selectedStreamingPlatformName = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Select Your Country',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                            fontSize: 14)),
                    Container(
                      width: 120,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: custom_color.backgroundPrimary,
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          menuMaxHeight: 200,
                          hint: Text(
                            'select',
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.5)),
                          ),
                          value: widget.selectedStreamingPlatformName,
                          items: _streamingPlatformList
                              .map((singleStreamingPLatform) {
                            return DropdownMenuItem(
                              value: singleStreamingPLatform.name,
                              child: Text(
                                singleStreamingPLatform.name,
                                style: const TextStyle(color: Colors.white),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) => setState(() {
                            Provider.of<StreamingPlatforms>(context,
                                    listen: false)
                                .setNewSelectedSteamingPlatformByName(value);
                            widget.selectedStreamingPlatformName = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                              color: custom_color.backgroundPrimary,
                              fontSize: 14),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
