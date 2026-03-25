import '../models/activity.dart';
import '../database/database_helper.dart';

class FitnessRepository {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<List<Activity>> getActivities() async {
    return await _databaseHelper.getActivities();
  }

  Future<void> addActivity(Activity activity) async {
    await _databaseHelper.insertActivity(activity);
  }

  Future<void> deleteActivity(String id) async {
    await _databaseHelper.deleteActivity(id);
  }
}
