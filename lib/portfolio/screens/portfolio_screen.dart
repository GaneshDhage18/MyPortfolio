import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/portfolio/screens/animatebackground.dart';
import 'package:portfolio/portfolio/widgets/feature_project_card.dart';
import '../sections/company_apps_carousel.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedGradientBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                  child: const SamarthCard()
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .slideY(begin: 0.12, curve: Curves.easeOut),
                ),
                const SizedBox(height: 100),
                const CompanyAppsCarousel()
                    .animate()
                    .fadeIn(delay: 150.ms)
                    .slideY(begin: 0.1),
                const SizedBox(height: 120),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                  child: const SideProjectsSection()
                      .animate()
                      .fadeIn(delay: 250.ms)
                      .slideY(begin: 0.1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// PROFILE CARD
/// =======================
class SamarthCard extends StatefulWidget {
  const SamarthCard({super.key});

  @override
  State<SamarthCard> createState() => _SamarthCardState();
}

class _SamarthCardState extends State<SamarthCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(_hover ? 0.18 : 0.15),
                    Colors.white.withOpacity(0.04),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.18),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent
                              .withOpacity(_hover ? 0.7 : 0.55),
                          blurRadius: 46,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/Ganesh-Profile.png',
                        alignment: Alignment.topCenter,
                        width: 160,
                        height: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                      .animate()
                      .scale(duration: 700.ms, curve: Curves.easeOutBack),

                  const SizedBox(width: 36),

                  /// Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Ganesh',
                          style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.6,
                            color: Colors.white,
                          ),
                        ).animate().fadeIn(delay: 150.ms).slideX(begin: -0.04),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10,
                          runSpacing: 8,
                          children: const [
                            _InfoChip('Flutter Developer'),
                            _InfoChip('2+ Years Experience'),
                            _InfoChip('Production Apps'),
                          ],
                        ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15),
                        const SizedBox(height: 18),
                        const Text(
                          'Flutter Developer with 2+ years of experience (including a 6-month internship) building scalable mobile applications. Contributed to production apps such as Reshimgathi Maratha Matrimony (10K+ downloads, 5K+ daily active users) and OKBarter. Experienced in translating Figma designs into pixel-perfect Flutter UIs, integrating REST APIs, and implementing scalable architectures using Bloc, GetX, and MVC for maintainable and high-performance applications.',
                          style: TextStyle(
                              color: Colors.white60,
                              fontSize: 16,
                              height: 1.65),
                        ).animate().fadeIn(delay: 420.ms).slideY(begin: 0.12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// =======================
/// INFO CHIP
/// =======================
class _InfoChip extends StatelessWidget {
  final String label;
  const _InfoChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
        ),
      ),
    );
  }
}

/// =======================
/// SIDE PROJECTS
/// =======================
class SideProjectsSection extends StatelessWidget {
  const SideProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tools & Developer Utilities',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.4,
            color: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 50),
          height: 3,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.cyanAccent, Colors.pinkAccent],
            ),
          ),
        ),
        FeatureProjectCard(
          title: 'VS Code Extension',
          description:
              'Clean Flutter BLoC Feature is a Visual Studio Code extension that automates the creation of scalable BLoC architecture '
              'feature folders in Flutter projects, improving developer productivity and maintainability.',
          tech: 'JavaScript • VS Code API',
          link:
              'https://open-vsx.org/extension/samarth/clean-flutter-bloc-feature',
          icon: Icons.extension,
        ),
      ],
    );
  }
}
