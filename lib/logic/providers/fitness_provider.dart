import 'package:flutter/foundation.dart';
import '../../data/models/activity.dart';
import '../../data/repositories/fitness_repository.dart';

class FitnessProvider with ChangeNotifier {
  final FitnessRepository _repository = FitnessRepository();
  List<Activity> _activities = [];
  bool _isLoading = true;

  FitnessProvider() {
    _loadActivities();
  }

  List<Activity> get activities => _activities;
  bool get isLoading => _isLoading;

  Future<void> _loadActivities() async {
    _isLoading = true;
    notifyListeners();
    _activities = await _repository.getActivities();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addActivity(Activity activity) async {
    await _repository.addActivity(activity);
    await _loadActivities();
  }

  Future<void> deleteActivity(String id) async {
    await _repository.deleteActivity(id);
    await _loadActivities();
  }

  int get totalSteps {
    return _activities.fold(0, (sum, activity) => sum + activity.steps);
  }

  int get totalCalories {
    return _activities.fold(0, (sum, activity) => sum + activity.calories);
  }

  double get totalDistance {
    return _activities.fold(0.0, (sum, activity) => sum + activity.distance);
  }

  int get totalWorkouts {
    return _activities.length;
  }
}
