import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset point1 = Offset(size.width / 4, size.height);
    Offset centerpoint = Offset(size.width / 2, 4 * size.height / 5);
    path.quadraticBezierTo(
        point1.dx, point1.dy, centerpoint.dx, centerpoint.dy);
    Offset point2 = Offset(3*size.width / 4, 3*size.height/5);
    Offset endpoint = Offset(size.width , 4 * size.height / 5);
    path.quadraticBezierTo(
        point2.dx, point2.dy, endpoint.dx, endpoint.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
