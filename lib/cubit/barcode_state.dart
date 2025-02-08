import 'package:equatable/equatable.dart';

abstract class BarcodeState extends Equatable {
  const BarcodeState();

  @override
  List<Object?> get props => [];
}

class BarcodeInitial extends BarcodeState {}

class BarcodeScanning extends BarcodeState {}

class BarcodeScanned extends BarcodeState {
  final String scannedData;
  const BarcodeScanned(this.scannedData);

  @override
  List<Object?> get props => [scannedData];
}

class BarcodeError extends BarcodeState {
  final String message;
  const BarcodeError(this.message);

  @override
  List<Object?> get props => [message];
}

class BarcodeGenerating extends BarcodeState {}

class BarcodeGenerated extends BarcodeState {
  final String qrData;
  const BarcodeGenerated(this.qrData);

  @override
  List<Object?> get props => [qrData];
}
