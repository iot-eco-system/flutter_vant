// ignore_for_file: deprecated_member_use

import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GlowlessScrollBehavior extends ScrollBehavior {
  final bool glowless;
  final ScrollBehavior? parent;
  const GlowlessScrollBehavior({
    this.glowless = true,
    this.parent,
  });

  @override
  GestureVelocityTrackerBuilder velocityTrackerBuilder(BuildContext context) {
    return (parent?.velocityTrackerBuilder ??
        super.velocityTrackerBuilder)(context);
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return (parent?.getScrollPhysics ?? super.getScrollPhysics)(context);
  }

  @override
  TargetPlatform getPlatform(BuildContext context) {
    return (parent?.getPlatform ?? super.getPlatform)(context);
  }

  @override
  Widget buildScrollbar(
      BuildContext context, Widget child, ScrollableDetails details) {
    return (parent?.buildScrollbar ?? super.buildScrollbar)(
        context, child, details);
  }

  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    if (glowless) {
      return child;
    } else {
      return (parent?.buildOverscrollIndicator ??
          super.buildOverscrollIndicator)(context, child, details);
    }
  }

  @override
  ScrollBehavior copyWith({
    bool? scrollbars,
    bool? overscroll,
    Set<PointerDeviceKind>? dragDevices,
    MultitouchDragStrategy? multitouchDragStrategy,
    Set<LogicalKeyboardKey>? pointerAxisModifiers,
    ScrollPhysics? physics,
    TargetPlatform? platform,
  }) {
    return GlowlessScrollBehavior(
      parent: parent?.copyWith(
        scrollbars: scrollbars,
        overscroll: overscroll,
        multitouchDragStrategy: multitouchDragStrategy,
        pointerAxisModifiers: pointerAxisModifiers,
        physics: physics,
        platform: platform,
        dragDevices: dragDevices,
      ),
      glowless: glowless,
    );
  }

  @override
  Set<PointerDeviceKind> get dragDevices =>
      parent?.dragDevices ?? super.dragDevices;

  @override
  bool shouldNotify(ScrollBehavior oldDelegate) => false;
}
