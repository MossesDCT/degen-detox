import 'package:flutter/material.dart';

const champagne = Color(0xffecd39c);
Color goldFor(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark
        ? champagne
        : const Color(0xff765019);

class GoldText extends StatelessWidget {
  const GoldText(this.text, {super.key, this.style, this.maxLines});
  final String text;
  final TextStyle? style;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return ShaderMask(
        blendMode: BlendMode.srcIn,
        shaderCallback: (rect) => LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: dark
                  ? const [
                      Color(0xffffeecb),
                      Color(0xffd7b678),
                      Color(0xfff4dfb5)
                    ]
                  : const [
                      Color(0xff6c4712),
                      Color(0xff936521),
                      Color(0xff674112)
                    ],
              stops: const [0, .55, 1],
            ).createShader(rect),
        child: Text(text,
            maxLines: maxLines,
            style: (style ?? const TextStyle(fontWeight: FontWeight.w700))
                .copyWith(
                    color: Colors.white,
                    shadows: dark
                        ? const [
                            Shadow(
                                color: Color(0x88000000),
                                offset: Offset(0, 1.4),
                                blurRadius: 1)
                          ]
                        : null)));
  }
}

class ForestBackdrop extends StatelessWidget {
  const ForestBackdrop(
      {super.key,
      required this.scroll,
      required this.light,
      required this.child});
  final ScrollController scroll;
  final bool light;
  final Widget child;
  @override
  Widget build(BuildContext context) => Stack(fit: StackFit.expand, children: [
        Positioned.fill(
            child: IgnorePointer(
                child: AnimatedBuilder(
          animation: scroll,
          builder: (_, unused) {
            final reduced = MediaQuery.disableAnimationsOf(context);
            final shift = !reduced && scroll.hasClients
                ? (scroll.offset * .045).clamp(0.0, 52.0)
                : 0.0;
            return Transform.translate(
                offset: Offset(0, -shift),
                child: Transform.scale(
                    scale: 1.16,
                    child: Image.asset('assets/images/forest.webp',
                        fit: BoxFit.cover, alignment: Alignment.topCenter)));
          },
        ))),
        Positioned.fill(
            child: IgnorePointer(
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: light
                                ? const [
                                    Color(0xeef4f3e8),
                                    Color(0xd9f0f0e3),
                                    Color(0xe5e6ecdc)
                                  ]
                                : const [
                                    Color(0xd9081812),
                                    Color(0xa60a1c14),
                                    Color(0xc9071711)
                                  ]))))),
        child,
      ]);
}

class LuxuryPanel extends StatelessWidget {
  const LuxuryPanel(
      {super.key,
      required this.child,
      this.padding = const EdgeInsets.all(24),
      this.pro = false});
  final Widget child;
  final EdgeInsets padding;
  final bool pro;
  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
        width: double.infinity,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: dark
                    ? const [Color(0xee1c382a), Color(0xf00b2018)]
                    : const [Color(0xfafffff5), Color(0xefedf0df)]),
            border: Border.all(
                color: pro
                    ? goldFor(context).withValues(alpha: .42)
                    : (dark
                        ? Colors.white.withValues(alpha: .13)
                        : const Color(0xffd4dcc7))),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withValues(alpha: dark ? .16 : .04),
                  blurRadius: 24,
                  offset: const Offset(0, 9))
            ]),
        child: child);
  }
}

class SoftEntrance extends StatelessWidget {
  const SoftEntrance({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.disableAnimationsOf(context)) return child;
    return TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 430),
        curve: Curves.easeOutCubic,
        builder: (_, value, child) => Opacity(
            opacity: value,
            child: Transform.translate(
                offset: Offset(0, 16 * (1 - value)), child: child)),
        child: child);
  }
}
