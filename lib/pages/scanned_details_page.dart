import 'package:flutter/material.dart';
import 'package:mrz_parser/mrz_parser.dart';

class ScannedDetailsPage extends StatelessWidget {
  final MRZResult result;

  const ScannedDetailsPage({required this.result, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanned Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text('Document Type: ${result.documentType}'),
            Text('Country: ${result.countryCode}'),
            Text('Surnames: ${result.surnames}'),
            Text('Given Names: ${result.givenNames}'),
            Text('Document Number: ${result.documentNumber}'),
            Text('Nationality Code: ${result.nationalityCountryCode}'),
            Text('Birthdate: ${result.birthDate}'),
            Text('Sex: ${result.sex}'),
            Text('Expiry Date: ${result.expiryDate}'),
            Text('Personal Number: ${result.personalNumber}'),
            Text('Personal Number 2: ${result.personalNumber2}'),
          ],
        ),
      ),
    );
  }
}
