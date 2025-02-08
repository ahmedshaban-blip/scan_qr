import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../cubit/barcode_cubit.dart';
import '../cubit/barcode_state.dart';

class GenerateQRScreen extends StatefulWidget {
  @override
  _GenerateQRScreenState createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generate QR Code")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: "Enter text or URL",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<BarcodeCubit>().generateQRCode(_textController.text);
              },
              child: Text("Generate QR Code"),
            ),
            SizedBox(height: 20),
            BlocBuilder<BarcodeCubit, BarcodeState>(
              builder: (context, state) {
                if (state is BarcodeGenerated) {
                  return QrImageView(
                    data: state.qrData,
                    version: QrVersions.auto,
                    size: 200.0,
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
