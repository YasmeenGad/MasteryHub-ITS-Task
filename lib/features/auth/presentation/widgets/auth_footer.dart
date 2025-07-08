import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter(
      {super.key,
      required this.leadingText,
      required this.actionText,
      this.onPressed});

  final String leadingText;
  final String actionText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text.rich(
        TextSpan(
          text: leadingText,
          children: [
            TextSpan(
              text: actionText,
              style: TextStyle(color: Color(0xFF00BF6D)),
            ),
          ],
        ),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .color!
                  .withOpacity(0.64),
            ),
      ),
    );
  }
}
