import 'package:flutter/material.dart';

class NotificationToggle extends StatefulWidget {
  final Function(bool isNew)? onChanged;

  const NotificationToggle({super.key, this.onChanged});

  @override
  State<NotificationToggle> createState() => _NotificationToggleState();
}

class _NotificationToggleState extends State<NotificationToggle> {
  bool isNewSelected = true;

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => isNewSelected = true);
              if (widget.onChanged != null) widget.onChanged!(true);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isNewSelected
                    ? const Color(0xFF2E5A27)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'New',
                style: TextStyle(
                  color: isNewSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => isNewSelected = false);
              if (widget.onChanged != null) widget.onChanged!(false);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: !isNewSelected
                    ? const Color(0xFF2E5A27)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'Old',
                style: TextStyle(
                  color: !isNewSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
