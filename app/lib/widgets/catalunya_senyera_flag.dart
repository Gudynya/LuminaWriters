import 'package:flutter/material.dart';

/// Bandera històrica de Catalunya: la [Senyera](https://ca.wikipedia.org/wiki/Senyera):
/// **nou franges horitzontals rectes** alternes (groga i vermella), començant per la groga superior.
/// Retall **circular** per alinear-se amb els emoji del selector.
///
/// **Cas puntual:** el català no té emoji de bandera estable a Unicode; ES/GB segueixen amb emoji.
class SenyeraFlag extends StatelessWidget {
  const SenyeraFlag({
    super.key,
    this.size = 26,
  });

  /// Costat del quadrat inscrit al cercle (mateixa àrea visual que els emoji ~22–26).
  final double size;

  static const Color yellow = Color(0xFFFCDD09);
  static const Color red = Color(0xFFC60B1E);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _SenyeraStraightPainter(),
      ),
    );
  }
}

/// Franxes rectes (geometria oficial de la senyera), dins d’un clip oval.
class _SenyeraStraightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final oval = Path()..addOval(Rect.fromLTWH(0, 0, w, h));
    canvas.clipPath(oval);

    final stripeH = h / 9;
    for (var i = 0; i < 9; i++) {
      final paint = Paint()
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..color = i.isEven ? SenyeraFlag.yellow : SenyeraFlag.red;
      canvas.drawRect(
        Rect.fromLTWH(0, i * stripeH, w, stripeH),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
