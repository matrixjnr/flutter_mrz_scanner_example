import 'package:flutter/material.dart';
import 'mrz_scanner_page.dart';
import 'scanned_details_page.dart';

class PassportFormPage extends StatefulWidget {
  @override
  _PassportFormPageState createState() => _PassportFormPageState();
}

class _PassportFormPageState extends State<PassportFormPage> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Passport Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Document Type'),
                onSaved: (value) => _formData['documentType'] = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Country'),
                onSaved: (value) => _formData['countryCode'] = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Surnames'),
                onSaved: (value) => _formData['surnames'] = value ?? '',
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Given Names'),
                onSaved: (value) => _formData['givenNames'] = value ?? '',
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MRZScannerPage(onScanned: (result) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ScannedDetailsPage(result: result),
                          ),
                        );
                      }),
                    ),
                  );
                },
                child: const Text('Scan Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
