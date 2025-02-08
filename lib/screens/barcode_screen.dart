import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:scan_qr/screens/generate_qr_screen.dart';
import '../cubit/barcode_cubit.dart';
import '../cubit/barcode_state.dart';

class BarcodeScreen extends StatefulWidget {
  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QR & Barcode Scanner")),
      body: BlocBuilder<BarcodeCubit, BarcodeState>(
        builder: (context, state) {
          if (state is BarcodeScanning) {
            return Center(child: CircularProgressIndicator());
          } else if (state is BarcodeScanned) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Scanned Data:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  SelectableText(state.scannedData, style: TextStyle(fontSize: 16, color: Colors.blue)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<BarcodeCubit>().reset(),
                    child: Text("Scan Again"),
                  ),
                ],
              ),
            );
          } else if (state is BarcodeError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Error: ${state.message}", style: TextStyle(color: Colors.red, fontSize: 16)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => context.read<BarcodeCubit>().reset(),
                    child: Text("Try Again"),
                  ),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                flex: 4,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: (QRViewController controller) {
                    this.controller = controller;
                    controller.scannedDataStream.listen((scanData) {
                      context.read<BarcodeCubit>().scanCompleted(scanData.code ?? "Unknown Data");
                    });
                  },
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => context.read<BarcodeCubit>().startScanning(),
                    child: Text("Start Scanning"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GenerateQRScreen()),
          );
        },
        child: Icon(Icons.qr_code),
      ),
    );
  }
}
