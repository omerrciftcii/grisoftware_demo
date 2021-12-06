import 'package:flutter/material.dart';
import 'package:grisoft/features/demo/presentation/widgets/curve_painter.dart';

class UrlShortenWidget extends StatefulWidget {
  const UrlShortenWidget({Key? key}) : super(key: key);

  @override
  _UrlShortenWidgetState createState() => _UrlShortenWidgetState();
}

class _UrlShortenWidgetState extends State<UrlShortenWidget> {
  @override
  Widget build(BuildContext context) {
    double w = 300;
    return Center(
      child: Container(
        color: Colors.yellow.withOpacity(.3),
        child: CustomPaint(
          size: Size(w, w * 0.5400),  
          painter: CurvePainter(),
        ),
      ),
    );
  }
}

// CustomPaint(
//     size: Size(400, (200*0.540084388185654).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )
