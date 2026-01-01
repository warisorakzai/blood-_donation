import 'package:blood_donation/provider/organization_provider.dart';
import 'package:blood_donation/widgets/organization_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrganizationScreen extends StatefulWidget {
  const OrganizationScreen({super.key});

  @override
  State<OrganizationScreen> createState() => _OrganizationScreenState();
}

class _OrganizationScreenState extends State<OrganizationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<OrganizationProvider>(
        context,
        listen: false,
      ).loadOrganizations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blood Donat Organization')),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
        onPressed: () {
          // navigate to add organization screen
        },
      ),
      body: Consumer<OrganizationProvider>(
        builder: (context, provider, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField(
                        hint: const Text('Country'),
                        items: ['Bangladesh', 'Pakistan']
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (val) => provider.setCountry(val.toString()),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField(
                        hint: const Text('City'),
                        items: ['Dhaka', 'Lahore']
                            .map(
                              (e) => DropdownMenuItem(value: e, child: Text(e)),
                            )
                            .toList(),
                        onChanged: (val) => provider.setCity(val.toString()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (provider.isLoading)
                  const CircularProgressIndicator()
                else
                  Expanded(
                    child: ListView.builder(
                      itemCount: provider
                          .organizations
                          .length, // ← Correct: length of list
                      itemBuilder: (context, index) {
                        return OrganizationCard(
                          org: provider
                              .organizations[index], // ← Correct property and index
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
