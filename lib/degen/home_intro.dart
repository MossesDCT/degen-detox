import 'package:flutter/material.dart';
import 'luxury.dart';

/// A finite entrance, not a continuously moving background.
class HomeIntro extends StatelessWidget {
  const HomeIntro({super.key, required this.slogan});
  final String slogan;
  @override
  Widget build(BuildContext context) {
    final reduced = MediaQuery.disableAnimationsOf(context);
    return Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 24),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Stack(children: [
              Positioned.fill(
                  child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: reduced ? 1 : 1.07, end: 1),
                      duration: reduced
                          ? Duration.zero
                          : const Duration(milliseconds: 1800),
                      curve: Curves.easeOutCubic,
                      builder: (_, scale, child) =>
                          Transform.scale(scale: scale, child: child),
                      child: Image.asset('assets/images/forest.webp',
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter,
                          excludeFromSemantics: true))),
              Positioned.fill(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                    const Color(0xff07170f).withValues(alpha: .05),
                    const Color(0xff07170f).withValues(alpha: .4),
                    const Color(0xff07170f).withValues(alpha: .98)
                  ],
                              stops: const [
                    0,
                    .4,
                    .75
                  ])))),
              Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border:
                          Border.all(color: champagne.withValues(alpha: .4))),
                  padding: const EdgeInsets.all(24),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xff0b1712)
                                    .withValues(alpha: .7),
                                border: Border.all(
                                    color: champagne.withValues(alpha: .45))),
                            child: const Icon(Icons.spa_outlined,
                                color: champagne, size: 28)),
                        const SizedBox(height: 66),
                        Container(width: 38, height: 2, color: champagne),
                        const SizedBox(height: 16),
                        Text(slogan,
                            style: const TextStyle(
                                color: Color(0xfff5f4e9),
                                fontSize: 23,
                                height: 1.35,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -.5)),
                      ])),
            ])));
  }
}

class HomeAction extends StatelessWidget {
  const HomeAction(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Material(
            color: c.surface.withValues(alpha: .86),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: c.primary.withValues(alpha: .16))),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
                onTap: onTap,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Row(children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: c.primary.withValues(alpha: .1),
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(icon, color: c.primary, size: 24)),
                      const SizedBox(width: 16),
                      Expanded(
                          child: Text(title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600))),
                      const SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18, color: c.primary),
                    ])))));
  }
}
