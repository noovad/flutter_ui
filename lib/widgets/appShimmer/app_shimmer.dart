import 'package:flutter/material.dart';

enum ShimmerShape {
  rectangle,
  circle,
}

class AppShimmer extends StatefulWidget {
  final double? height;
  final double? width;
  final ShimmerShape shape;
  final double? borderRadius;

  const AppShimmer({
    super.key,
    this.height,
    this.width,
    this.shape = ShimmerShape.rectangle,
    this.borderRadius,
  });

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _buildShimmerWidget();
      },
    );
  }

  Widget _buildShimmerWidget() {
    shimmerShader(Rect bounds) {
      return LinearGradient(
        colors: [
          Colors.grey.shade300,
          Colors.grey.shade100,
          Colors.grey.shade300,
        ],
        stops: const [0.0, 0.5, 1.0],
        begin: Alignment(-1.0 + 2.0 * _controller.value, 0.0),
        end: Alignment(1.0 + 2.0 * _controller.value, 0.0),
        tileMode: TileMode.clamp,
      ).createShader(bounds);
    }

    switch (widget.shape) {
      case ShimmerShape.circle:
        final size = widget.height ?? widget.width ?? 50.0;
        return SizedBox(
          height: size,
          width: size,
          child: ClipOval(
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: shimmerShader,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        );

      case ShimmerShape.rectangle:
        final radius = widget.borderRadius ?? 0.0;
        return SizedBox(
          height: widget.height,
          width: widget.width ?? double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: shimmerShader,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        );
    }
  }
}
