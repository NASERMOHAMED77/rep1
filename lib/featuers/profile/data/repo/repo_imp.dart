import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rep1/featuers/profile/data/repo/repo.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:rep1/featuers/track/data/model/workout_track_model.dart';
import 'package:open_file/open_file.dart';

class ProfileRepoImp extends ProfileRepo {
  @override
  void searchforWorkout(String workout) {
    // TODO: implement searchforWorkout
  }

  @override
  Future<File> generatePdf() async {
    final pdf = pw.Document();

    // Get data from Hive
    final data = Hive.box<WorkoutTrackModel>("Workouts").values.toList();

    // Create a PDF page
    pdf.addPage(pw.MultiPage(
      build: (pw.Context context) {
        return [
          pw.Header(
            level: 1,
            child: pw.Text('Rep1'),
          ),
          pw.Paragraph(text: 'This is a pdf that contain your workout data.'),
          pw.Table.fromTextArray(
            context: context,
            data: [
              ['workout', 'workoutset', 'wights', 'reps', 'day', 'rest'],
              ...data.map((item) => [
                    item.workout,
                    item.workoutSet,
                    item.sets,
                    item.reps,
                    item.day,
                    item.rest
                  ]),
            ],
          ),
        ];
      },
    ));
    final directory = await getExternalStorageDirectory();
    print('done');

    final file = File("${directory?.path}/example.pdf");
    print(file);

    // Save the PDF to a file
    final pdfBytes = await pdf.save();
    await file.writeAsBytes(pdfBytes.toList());
    await OpenFile.open(file.path);
    return file;
  }
}
