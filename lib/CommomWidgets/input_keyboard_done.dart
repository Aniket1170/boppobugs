import 'package:flutter/material.dart';

class InputDoneView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        width: double.infinity,
        color: Colors.grey[300],
        child: Align(
          alignment: Alignment.topRight,
          child: TextButton(
            // padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8.0),
            onPressed: () {
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Text("Done",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      );
}

class InputKeyboardDone {
  OverlayEntry? _overlayEntry;
  showOverlay(BuildContext context) {
    // if (_overlayEntry != null) return;
    OverlayState? overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            right: 0.0,
            left: 0.0,
            child: InputDoneView()));

    overlayState?.insert(_overlayEntry!);
  }

  removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }
}
