import 'package:flutter_bloc/flutter_bloc.dart';
import 'barcode_state.dart';

class BarcodeCubit extends Cubit<BarcodeState> {
  BarcodeCubit() : super(BarcodeInitial());

  void startScanning() {
    emit(BarcodeScanning());
  }

  void scanCompleted(String scannedData) {
    emit(BarcodeScanned(scannedData));
  }

  void scanError(String errorMessage) {
    emit(BarcodeError(errorMessage));
  }

  void generateQRCode(String data) {
    if (data.isNotEmpty) {
      emit(BarcodeGenerated(data));
    } else {
      emit(BarcodeError("Please enter valid text!"));
    }
  }

  void reset() {
    emit(BarcodeInitial());
  }
}
