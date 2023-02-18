import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
            errors.length, (index) => formErrorText(err: errors[index]))
      ],
    );
  }

  Row formErrorText({String? err}) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/Error.svg',
          height: 14,
          width: 14,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(err!)
      ],
    );
  }
}
