import 'package:flutter/material.dart';
import 'package:flutter_mrz_scanner/flutter_mrz_scanner.dart';
import 'package:mrz_parser/mrz_parser.dart';

class MRZScannerPage extends StatefulWidget {
  final Function(MRZResult) onScanned;

  const MRZScannerPage({required this.onScanned, Key? key}) : super(key: key);

  @override
  _MRZScannerPageState createState() => _MRZScannerPageState();
}

class _MRZScannerPageState extends State<MRZScannerPage> {
  MRZController? _controller;
  bool _isScanning = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Passport')),
      body: _isScanning
          ? MRZScanner(
        withOverlay: true,
        onControllerCreated: (controller) {
          _controller = controller;

          // Directly access fields using dot notation
          _controller?.onParsed = (data) {
            final result = MRZResult(
              documentType: data.documentType ?? '',
              countryCode: data.countryCode ?? '',
              surnames: data.surnames ?? '',
              givenNames: data.givenNames ?? '',
              documentNumber: data.documentNumber ?? '',
              nationalityCountryCode: data.nationalityCountryCode ?? '',
              birthDate: data.birthDate,
              sex: data.sex,
              expiryDate: data.expiryDate,
              personalNumber: data.personalNumber ?? '',
              personalNumber2: data.personalNumber2 ?? '',
            );

            setState(() => _isScanning = false);
            widget.onScanned(result);
          };

          _controller?.onError = (error) => print(error);
          _controller?.startPreview();
        },
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    _controller?.stopPreview();
    super.dispose();
  }
}
