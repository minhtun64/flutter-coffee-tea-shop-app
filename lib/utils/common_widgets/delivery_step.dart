import 'package:flutter/material.dart';

import '../../values/app_colors.dart';

class BuildStep extends StatefulWidget {
  final int number;
  final String text;
  final bool isActive;

  const BuildStep({
    Key? key,
    required this.number,
    required this.text,
    required this.isActive,
  }) : super(key: key);

  @override
  State<BuildStep> createState() => _BuildStepState();
}

class _BuildStepState extends State<BuildStep> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 26,
            child: CircleAvatar(
              backgroundColor:
                  widget.isActive ? AppColors.primaryColor : Colors.grey,
              child: Text(
                widget.number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.text,
            style: TextStyle(
              color: widget.isActive ? AppColors.primaryColor : Colors.grey,
              // fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
