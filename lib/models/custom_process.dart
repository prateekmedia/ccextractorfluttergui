import 'dart:async';
import 'dart:convert';

import 'dart:io';

/// Class which exposes a start command method to start process and stdErr, stdOut streams.
class CustomProcess {
  late Process _process;
  final String filePath;

  CustomProcess(this.filePath);
  Future startprocess() async {
    print("started");
    _process = await Process.start(
      './assets/ccextractor',
      [filePath, '--gui_mode_reports', '-latin1'],
    );
  }

  /// Emits a new value from stderr everytime it updates.
  Stream processStdError() {
    return _process.stderr.transform(latin1.decoder);
  }

  Stream processStdOut() {
    return _process.stdout.transform(latin1.decoder);
  }
}
