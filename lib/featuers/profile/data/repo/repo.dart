import 'dart:io';

abstract class ProfileRepo {
  void searchforWorkout(String workout);
  Future<File> generatePdf();
}
