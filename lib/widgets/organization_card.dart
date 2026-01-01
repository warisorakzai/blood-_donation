import 'package:flutter/material.dart';
import '../models/organization_model.dart';

class OrganizationCard extends StatelessWidget {
  final OrganizationModel org;

  const OrganizationCard({super.key, required this.org});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                org.image,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(org.name,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(org.address,
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 4),
                  Text(org.phone,
                      style: const TextStyle(fontSize: 12)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {},
                    child: const Text('Chat Now'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
