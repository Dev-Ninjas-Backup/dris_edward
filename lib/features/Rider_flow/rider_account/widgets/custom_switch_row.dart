import 'package:flutter/material.dart';

class CustomSettingTile extends StatefulWidget {
  final String title;
  final String iconPath;
  final IconData? icon;
  final bool showToggle;
  final bool initialToggleValue;
  final ValueChanged<bool>? onToggleChanged;
  final VoidCallback? onTap;

  const CustomSettingTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.icon,
    this.showToggle = true,
    this.initialToggleValue = false,
    this.onToggleChanged,
    this.onTap,
  });

  @override
  State<CustomSettingTile> createState() => _CustomSettingTileState();
}

class _CustomSettingTileState extends State<CustomSettingTile> {
  late bool toggleValue;

  @override
  void initState() {
    super.initState();
    toggleValue = widget.initialToggleValue;
  }

  void _handleToggleChange(bool value) {
    setState(() {
      toggleValue = value;
    });
    widget.onToggleChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null)
                  Icon(widget.icon, size: 24, color: Colors.black54)
                else
                  Image.asset(
                    widget.iconPath,
                    width: 24,
                    height: 24,
                    color: Colors.black54,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.notifications, color: Colors.grey),
                  ),
                const SizedBox(width: 12),
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            // Toggle Logic
            if (widget.showToggle)
              Switch(
                value: toggleValue,
                onChanged: _handleToggleChange,
                activeThumbColor: Colors.white,
                activeTrackColor: const Color(0xFF2E5A27),
                inactiveThumbColor: const Color(0xFFC0C0C0),
                inactiveTrackColor: Colors.grey.shade300,
              ),
          ],
        ),
      ),
    );
  }
}
