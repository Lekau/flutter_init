import 'package:flutter/material.dart';
import 'button_styles.dart';

class COMPONENT_NAMEButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final ButtonStyle? style;
  final IconData? icon;

  const COMPONENT_NAMEButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.style,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: style ?? COMPONENT_NAMEButtonStyles.primaryButtonStyle,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (icon != null) ...[
                    Icon(icon),
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }
} 