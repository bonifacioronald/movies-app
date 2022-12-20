import 'package:flutter/material.dart';

import '../models/colors.dart' as custom_color;

class GradientImageStack extends StatelessWidget {
  String imageUrl;
  double endPoint;
  bool isPotrait;

  GradientImageStack({
    required this.imageUrl,
    required this.endPoint,
    required this.isPotrait,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
            height: double.infinity,
            width: double.infinity,
            child: FadeInImage(
              placeholder: isPotrait
                  ? AssetImage('assets/images/loading_potrait.png')
                  : AssetImage('assets/images/loading_landscape.png'),
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
              height: double.infinity,
            )),
        Container(
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              stops: [0.0, endPoint],
              colors: [
                custom_color.backgroundPrimary.withOpacity(0.0),
                custom_color.backgroundPrimary,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
