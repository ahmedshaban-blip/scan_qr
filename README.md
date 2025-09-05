# Scan_QR
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/ahmedshaban-blip/scan_qr)

A Flutter application for both scanning and generating QR codes and barcodes. This project demonstrates the integration of QR code functionalities within a Flutter app using `flutter_bloc` for state management.

## Features

*   **Scan QR & Barcodes:** Utilizes the device camera to scan QR codes and barcodes in real-time.
*   **Generate QR Codes:** Creates QR codes from user-provided text or URLs.
*   **State-Driven UI:** Employs the BLoC pattern with `BarcodeCubit` to manage UI states for scanning, data display, and generation.
*   **Cross-Platform:** Built with Flutter, supporting multiple platforms including Android, iOS, Web, and Desktop.

## Project Structure

The application's core logic is organized within the `lib/` directory:

-   `main.dart`: The entry point of the application, responsible for initializing the `BlocProvider`.
-   `cubit/`: Contains the state management logic.
    -   `barcode_cubit.dart`: Manages the application's state, handling events for scanning, generation, and error reporting.
    -   `barcode_state.dart`: Defines the different states of the application, such as initial, scanning, scanned, generated, and error.
-   `screens/`: Contains the UI components of the application.
    -   `barcode_screen.dart`: The main screen featuring the QR code scanner view using the `qr_code_scanner_plus` package. It displays the scanned data upon completion.
    -   `generate_qr_screen.dart`: A screen where users can input text to generate a QR code, which is then displayed using the `qr_flutter` package.

## Getting Started

To run this project locally, follow these steps.

### Prerequisites

-   Ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed on your system.
-   An editor like VS Code or Android Studio with the Flutter plugin.

### Installation & Execution

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/ahmedshaban-blip/scan_qr.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd scan_qr
    ```

3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

4.  **Run the application:**
    ```sh
    flutter run
    ```

### Usage

-   **To Scan a Code:** The app opens to the scanner view. Press the "Start Scanning" button and point the camera at a QR code or barcode. The scanned data will appear on the screen.
-   **To Generate a Code:** Tap the QR code icon (Floating Action Button) on the main screen. Enter your desired text or URL into the text field and press the "Generate QR Code" button. The corresponding QR code will be displayed below.
