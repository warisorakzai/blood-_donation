import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const MenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: ListTile(
            leading: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.red.shade100,
              child: Icon(icon, size: 18, color: Colors.red),
            ),
            title: Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Colors.grey,
            ),
            onTap: onTap,
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }
}
