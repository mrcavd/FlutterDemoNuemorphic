import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class HourglazzPalette {
  final Color hourglazzHighlight = Color(0xffded8c8);

  final Color hourglazzGrey = Color(0xff807a70);
  final Color hourglazzLightGrey = Color(0xffb5b0a3);
  final Color hourglazzDarkGrey = Color(0xff4f4c46);
  final Color hourglazzDarkerGrey = Color(0xff423f3a);
  final Color hourglazzShadowGrey = Color(0xff2a2a2a);

  final Color hourglazzWhite = Color(0xfffffff);
  final Color hourglazOffwhite = Color(0xfff5f5f5);
  final Color hourglazzYellow = Color(0xffcca123);
}

class ConcaveDecoration extends Decoration {
  final ShapeBorder shape;
  final double depth;
  final List<Color> colors;
  final double opacity;

  ConcaveDecoration({
    @required this.shape,
    @required this.depth,
    this.colors = const [Colors.black87, Colors.white],
    this.opacity = 1.0,
  })  : assert(shape != null),
        assert(colors == null || colors.length == 2);

  @override
  BoxPainter createBoxPainter([onChanged]) =>
      _ConcaveDecorationPainter(shape, depth, colors, opacity);

  @override
  EdgeInsetsGeometry get padding => shape.dimensions;

  @override
  Decoration lerpFrom(Decoration a, double t) {
    if (a is ConcaveDecoration) {
      t = Curves.easeInOut.transform(t);
      return ConcaveDecoration(
        shape: ShapeBorder.lerp(a.shape, shape, t),
        depth: ui.lerpDouble(a.depth, depth, t),
        colors: [
          Color.lerp(a.colors[0], colors[0], t),
          Color.lerp(a.colors[1], colors[1], t),
        ],
        opacity: ui.lerpDouble(a.opacity, opacity, t),
      );
    }
    return null;
  }
}

class _ConcaveDecorationPainter extends BoxPainter {
  ShapeBorder shape;
  double depth;
  List<Color> colors;
  double opacity;

  _ConcaveDecorationPainter(this.shape, this.depth, this.colors, this.opacity) {
    if (depth > 0) {
      colors = [
        colors[1],
        colors[0],
      ];
    } else {
      depth = -depth;
    }
    colors = [
      colors[0].withOpacity(opacity),
      colors[1].withOpacity(opacity),
    ];
  }

  @override
  void paint(
      ui.Canvas canvas, ui.Offset offset, ImageConfiguration configuration) {
    final shapePath = shape.getOuterPath(offset & configuration.size);
    final rect = shapePath.getBounds();

    final delta = 16 / rect.longestSide;
    final stops = [0.5 - delta, 0.5 + delta];

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rect.inflate(depth * 2))
      ..addPath(shapePath, Offset.zero);
    canvas.save();
    canvas.clipPath(shapePath);

    final paint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, depth);
    final clipSize = rect.size.aspectRatio > 1
        ? Size(rect.width, rect.height / 2)
        : Size(rect.width / 2, rect.height);
    for (final alignment in [Alignment.topLeft, Alignment.bottomRight]) {
      final shaderRect =
          alignment.inscribe(Size.square(rect.longestSide), rect);
      paint
        ..shader = ui.Gradient.linear(
            shaderRect.topLeft, shaderRect.bottomRight, colors, stops);

      canvas.save();
      canvas.clipRect(alignment.inscribe(clipSize, rect));
      canvas.drawPath(path, paint);
      canvas.restore();
    }
    canvas.restore();
  }
}
