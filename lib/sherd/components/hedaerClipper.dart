import 'package:flutter/material.dart';
class headrclipper extends StatelessWidget {
  final String labelheder;
  final Color? colorContainer;
  final int flex;
  final double? fontSize;
  final Color? textColor;
  const headrclipper({super.key,
   required this.labelheder,
    this.colorContainer,
    required this.flex,
    this.fontSize,
    this.textColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:flex,
      child: ClipPath(
        clipper: headclipper(),
        child: Container(
          color:colorContainer ,
          child: Center(
            child: Text(labelheder,
            style: TextStyle(
              fontSize:fontSize,
              color:textColor,
               
            ),
            ),
          ),
        ),
      ),
    );
  }
}

class headclipper extends CustomClipper <Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(0 * _xScaling,-3.194725 * _yScaling);
    path.cubicTo(0 * _xScaling,-3.194725 * _yScaling,0 * _xScaling,753.6388609999999 * _yScaling,0 * _xScaling,753.6388609999999 * _yScaling,);
    path.cubicTo(95.921754 * _xScaling,504.874852 * _yScaling,196.0248 * _xScaling,939.4976529999999 * _yScaling,496.753247 * _xScaling,756.9438049999999 * _yScaling,);
    path.cubicTo(496.753247 * _xScaling,756.9438049999999 * _yScaling,500 * _xScaling,1.7626970000000002 * _yScaling,500 * _xScaling,1.7626970000000002 * _yScaling,);
    path.cubicTo(487.365494 * _xScaling,-7.170039999999999 * _yScaling,226.59491300000005 * _xScaling,-1.4260249999999997 * _yScaling,1.6209256159527285e-14 * _xScaling,-3.194726 * _yScaling,);
    path.cubicTo(1.6209256159527285e-14 * _xScaling,-3.194726 * _yScaling,0 * _xScaling,-3.194725 * _yScaling,0 * _xScaling,-3.194725 * _yScaling,);
    path.cubicTo(0 * _xScaling,-3.194725 * _yScaling,400 * _xScaling,1.7626970000000002 * _yScaling,400 * _xScaling,1.7626970000000002 * _yScaling,);
    path.cubicTo(389.892395 * _xScaling,-7.170039999999999 * _yScaling,181.27593100000004 * _xScaling,-1.4260249999999997 * _yScaling,1.6209256159527285e-14 * _xScaling,-3.194726 * _yScaling,);
    path.cubicTo(1.6209256159527285e-14 * _xScaling,-3.194726 * _yScaling,0 * _xScaling,-3.194725 * _yScaling,0 * _xScaling,-3.194725 * _yScaling,);
    return path;
  }
  


  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}