import 'package:first_aid_app/generated/l10n.dart';
import 'package:flutter/material.dart';

// Simple static screen to show about us information using localized strings
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Styles for text reuse
    final baseStyle = TextStyle(fontFamily: 'Poppins', fontSize: 16);
    final boldStyle = TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).tAboutUs,
          style: TextStyle(fontFamily: 'Poppins'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Main header
            Text(
              S.of(context).taboutPGUFA,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Introduction paragraph
            Text(S.of(context).taboutHeader, style: baseStyle),
            const SizedBox(height: 24),

            // Section 1
            Text(S.of(context).taboutHeader1, style: boldStyle),
            const SizedBox(height: 8),
            Text(S.of(context).taboutParagraph, style: baseStyle),
            const SizedBox(height: 24),

            // Section 2
            Text(S.of(context).taboutHeader2, style: boldStyle),
            const SizedBox(height: 8),
            Text(S.of(context).taboutParagraph2, style: baseStyle),
            const SizedBox(height: 24),

            // Section 3
            Text(S.of(context).taboutHeader3, style: boldStyle),
            const SizedBox(height: 8),
            Text(S.of(context).taboutParagraph3, style: baseStyle),
            const SizedBox(height: 24),

            // Section 4
            Text(S.of(context).taboutHeader4, style: boldStyle),
            const SizedBox(height: 8),
            Text(S.of(context).taboutParagraph4, style: baseStyle),
          ],
        ),
      ),
    );
  }
}
