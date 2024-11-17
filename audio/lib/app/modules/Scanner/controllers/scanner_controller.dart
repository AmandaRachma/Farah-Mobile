import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerController {
  // Variabel untuk menyimpan hasil pemindaian
  String qrText = "Scan a code";

  // Fungsi untuk menangani pemindaian QR code
  void handleScan(QRViewController controller, String scanData) {
    qrText = scanData;  // Update hasil pemindaian
  }

  // Fungsi untuk memulai pemindaian QR
  void startScan(QRViewController controller) {
    controller.resumeCamera();
  }

  // Fungsi untuk menghentikan pemindaian QR
  void stopScan(QRViewController controller) {
    controller.pauseCamera();
  }
}