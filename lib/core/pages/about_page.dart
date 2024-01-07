import 'package:flutter/material.dart';
import 'package:kordi_mobile/gen/assets.gen.dart';
import 'package:kordi_mobile/gen/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

const _githubUrl = 'https://github.com/monake1479/kordi_mobile';
const _linkedinUrl = 'https://www.linkedin.com/in/oblak1479/';
const _undrawCoUrl = 'https://undraw.co/';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Text(
              S.current.aboutPageTitle,
              style: textTheme.headlineLarge,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.aboutPageGenesisDescription,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text.rich(
                textAlign: TextAlign.justify,
                TextSpan(
                  children: [
                    TextSpan(
                      text: S.current.aboutPageExplanationDescriptionPartOne,
                      style: textTheme.bodyLarge,
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () async => _onGithubKordiNavigation(),
                        child: Text(
                          '(https://github.com/KUGELO2424/Kordi).',
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    TextSpan(
                      text: S.current.aboutPageExplanationDescriptionPartTwo,
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.aboutPageProjectDescription,
                style: textTheme.bodyLarge,
                textAlign: TextAlign.justify,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                S.current.aboutPageAuthor,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: S.current.aboutPageIconsAndImages,
                      style: textTheme.bodyLarge,
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () async => _onUndrawUrlNavigation(),
                        child: Text(
                          _undrawCoUrl,
                          style: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async => _onGithubLogoNavigation(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Assets.icons.githubLogo.svg(
                        width: 26,
                      ),
                    ),
                    Text(
                      S.current.aboutPageGithub,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    Flexible(
                      child: Text(
                        _githubUrl,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () async => _onLinkedinLogoNavigation(),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Assets.icons.linkedinLogo.image(
                        width: 26,
                      ),
                    ),
                    Text(
                      S.current.aboutPageLinkedin,
                      style: textTheme.bodyLarge,
                      textAlign: TextAlign.justify,
                    ),
                    Flexible(
                      child: Text(
                        _linkedinUrl,
                        style: textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                          decoration: TextDecoration.underline,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.current.aboutPageCopyRight,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: GestureDetector(
                      onTap: () async => _onGithubLogoNavigation(),
                      child: Assets.icons.githubLogo.svg(
                        width: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onUndrawUrlNavigation() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'undraw.co',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _onGithubKordiNavigation() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'KUGELO2424/Kordi',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _onGithubLogoNavigation() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'github.com',
      path: 'monake1479/kordi_mobile',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  Future<void> _onLinkedinLogoNavigation() async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'linkedin.com',
      path: 'in/oblak1479/',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
