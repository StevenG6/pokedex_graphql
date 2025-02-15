import 'package:flutter/material.dart';
import 'package:pokedex_graphql/presentation/core/theme/colors.dart';

class PokedexPainter extends CustomPainter {
  PokedexPainter({super.repaint, required this.backgroundColor});

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final paint = Paint()..color = AppColors.cellBackground;
    canvas.drawRRect(RRect.fromLTRBR(0, 0, width, height, const Radius.circular(30)), paint);

    paint.color = backgroundColor;
    canvas.drawRRect(RRect.fromLTRBR(width * .1, height * .15, width * .9, height * .85, const Radius.circular(20)), paint);

    paint
        ..color = Colors.redAccent
        ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(width * .45, height * .08), 7, paint);
    canvas.drawCircle(Offset(width * .55, height * .08), 7, paint);
    canvas.drawCircle(Offset(width * .2, height * 0.93), 12, paint);
    
    paint
        ..style = PaintingStyle.stroke
        ..color = Colors.black
        ..strokeWidth = 1;

    canvas.drawRRect(RRect.fromLTRBR(0, 1, width, height, const Radius.circular(30)), paint);
    canvas.drawRRect(RRect.fromLTRBR(width * .1, height * .15, width * .9, height * .85, const Radius.circular(20)), paint);
    
    canvas.drawCircle(Offset(width * .45, height * .08), 7, paint);
    canvas.drawCircle(Offset(width * .55, height * .08), 7, paint);
    canvas.drawCircle(Offset(width * .2, height * 0.93), 12, paint);

    canvas.drawLine(Offset(width * .7, height * 0.9), Offset(width * .85, height * 0.9), paint);
    canvas.drawLine(Offset(width * .7, height * 0.925), Offset(width * .85, height * 0.925), paint);
    canvas.drawLine(Offset(width * .7, height * 0.95), Offset(width * .85, height * 0.95), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
