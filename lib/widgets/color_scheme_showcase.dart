// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ColorSchemeShowcase extends StatelessWidget {
  const ColorSchemeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Scheme Showcase"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSectionTitle("Primary Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("primary", colorScheme.primary,
                    "Main brand color for buttons, active states"),
                ColorItem("onPrimary", colorScheme.onPrimary,
                    "Text/icons on primary color"),
                ColorItem("primaryContainer", colorScheme.primaryContainer,
                    "Less prominent primary containers"),
                ColorItem("onPrimaryContainer", colorScheme.onPrimaryContainer,
                    "Text/icons on primaryContainer"),
              ],
            ),
            _buildSectionTitle("Primary Fixed Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("primaryFixed", colorScheme.primaryFixed,
                    "Fixed shade primary that stays consistent"),
                ColorItem("primaryFixedDim", colorScheme.primaryFixedDim,
                    "Dimmer version of primaryFixed"),
                ColorItem("onPrimaryFixed", colorScheme.onPrimaryFixed,
                    "Content on primaryFixed"),
                ColorItem(
                    "onPrimaryFixedVariant",
                    colorScheme.onPrimaryFixedVariant,
                    "Variant for content on fixed surfaces"),
              ],
            ),
            _buildSectionTitle("Secondary Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("secondary", colorScheme.secondary,
                    "Less prominent accent color"),
                ColorItem("onSecondary", colorScheme.onSecondary,
                    "Text/icons on secondary color"),
                ColorItem("secondaryContainer", colorScheme.secondaryContainer,
                    "Secondary containers like chips"),
                ColorItem(
                    "onSecondaryContainer",
                    colorScheme.onSecondaryContainer,
                    "Text/icons on secondaryContainer"),
              ],
            ),
            _buildSectionTitle("Secondary Fixed Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("secondaryFixed", colorScheme.secondaryFixed,
                    "Fixed shade secondary that stays consistent"),
                ColorItem("secondaryFixedDim", colorScheme.secondaryFixedDim,
                    "Dimmer version of secondaryFixed"),
                ColorItem("onSecondaryFixed", colorScheme.onSecondaryFixed,
                    "Content on secondaryFixed"),
                ColorItem(
                    "onSecondaryFixedVariant",
                    colorScheme.onSecondaryFixedVariant,
                    "Variant for secondary fixed content"),
              ],
            ),
            _buildSectionTitle("Tertiary Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("tertiary", colorScheme.tertiary,
                    "Third accent color for balance"),
                ColorItem("onTertiary", colorScheme.onTertiary,
                    "Text/icons on tertiary color"),
                ColorItem("tertiaryContainer", colorScheme.tertiaryContainer,
                    "Tertiary-colored containers"),
                ColorItem(
                    "onTertiaryContainer",
                    colorScheme.onTertiaryContainer,
                    "Content on tertiaryContainer"),
              ],
            ),
            _buildSectionTitle("Tertiary Fixed Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("tertiaryFixed", colorScheme.tertiaryFixed,
                    "Fixed shade tertiary color"),
                ColorItem("tertiaryFixedDim", colorScheme.tertiaryFixedDim,
                    "Dimmer version of tertiaryFixed"),
                ColorItem("onTertiaryFixed", colorScheme.onTertiaryFixed,
                    "Content on tertiaryFixed"),
                ColorItem(
                    "onTertiaryFixedVariant",
                    colorScheme.onTertiaryFixedVariant,
                    "Variant for tertiary fixed content"),
              ],
            ),
            _buildSectionTitle("Error Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem(
                    "error", colorScheme.error, "For error states and alerts"),
                ColorItem("onError", colorScheme.onError,
                    "Text/icons on error color"),
                ColorItem("errorContainer", colorScheme.errorContainer,
                    "Container for error-related content"),
                ColorItem("onErrorContainer", colorScheme.onErrorContainer,
                    "Text/icons on errorContainer"),
              ],
            ),
            _buildSectionTitle("Surface Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("surface", colorScheme.surface,
                    "Main surface color for cards, sheets"),
                ColorItem("onSurface", colorScheme.onSurface,
                    "Text/icons on surface color"),
                ColorItem("surfaceDim", colorScheme.surfaceDim,
                    "Dimmer version of surface"),
                ColorItem("surfaceBright", colorScheme.surfaceBright,
                    "Brighter version of surface"),
              ],
            ),
            _buildSectionTitle("Surface Container Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem(
                    "surfaceContainerLowest",
                    colorScheme.surfaceContainerLowest,
                    "Lowest elevation container"),
                ColorItem("surfaceContainerLow",
                    colorScheme.surfaceContainerLow, "Low elevation container"),
                ColorItem("surfaceContainer", colorScheme.surfaceContainer,
                    "Standard container"),
                ColorItem(
                    "surfaceContainerHigh",
                    colorScheme.surfaceContainerHigh,
                    "High elevation container"),
                ColorItem(
                    "surfaceContainerHighest",
                    colorScheme.surfaceContainerHighest,
                    "Highest elevation container"),
              ],
            ),
            _buildSectionTitle("Additional Surface Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("onSurfaceVariant", colorScheme.onSurfaceVariant,
                    "Secondary content on surface"),
                ColorItem("inverseSurface", colorScheme.inverseSurface,
                    "Contrasting surface color"),
                ColorItem("onInverseSurface", colorScheme.onInverseSurface,
                    "Content on inverseSurface"),
                ColorItem("inversePrimary", colorScheme.inversePrimary,
                    "Primary color on inverse background"),
                ColorItem("surfaceTint", colorScheme.surfaceTint,
                    "Tint applied to surface at elevation"),
              ],
            ),
            _buildSectionTitle("Outline Colors"),
            _buildColorGroup(
              colorItems: [
                ColorItem("outline", colorScheme.outline, "Borders, dividers"),
                ColorItem("outlineVariant", colorScheme.outlineVariant,
                    "Subtle borders, decorative elements"),
                ColorItem(
                    "shadow", colorScheme.shadow, "Shadows for elevation"),
                ColorItem(
                    "scrim", colorScheme.scrim, "Scrim for modals and dialogs"),
              ],
            ),
            _buildSectionTitle("Usage Examples"),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Primary Button",
                        style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                      ),
                      child: const Text("Primary Action"),
                    ),
                    const SizedBox(height: 16),
                    Text("Card with Surface Container",
                        style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: colorScheme.outline),
                      ),
                      child: Text(
                        "This is using surfaceContainer with outline border",
                        style: TextStyle(color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Error Message",
                        style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme.errorContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "This is an error message using errorContainer",
                        style: TextStyle(color: colorScheme.onErrorContainer),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text("Surface Container Elevation Examples",
                        style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerLowest,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: colorScheme.outline),
                            ),
                            child: const Text("Lowest"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: colorScheme.outline),
                            ),
                            child: const Text("Low"),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: colorScheme.outline),
                            ),
                            child: const Text("Highest"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text("Fixed Color Variations",
                        style: TextStyle(color: colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            color: colorScheme.primaryFixed,
                            child: Text(
                              "Primary Fixed",
                              style:
                                  TextStyle(color: colorScheme.onPrimaryFixed),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            height: 60,
                            alignment: Alignment.center,
                            color: colorScheme.primaryFixedDim,
                            child: Text(
                              "Primary Fixed Dim",
                              style: TextStyle(
                                  color: colorScheme.onPrimaryFixedVariant),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildColorGroup({required List<ColorItem> colorItems}) {
    return Column(
      children: [
        for (final item in colorItems) _buildColorTile(item),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  Widget _buildColorTile(ColorItem item) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: item.color,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  item.description,
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  "HEX: #${item.color.value.toRadixString(16).substring(2).toUpperCase()}",
                  style: const TextStyle(fontSize: 12, fontFamily: "poppins"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ColorItem {
  final String name;
  final Color color;
  final String description;

  ColorItem(this.name, this.color, this.description);
}
