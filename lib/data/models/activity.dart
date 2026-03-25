class Activity {
  String id;
  String type;
  int duration; // minutes
  int calories;
  double distance; // km
  int steps;
  String notes;
  DateTime timestamp;

  Activity({
    required this.id,
    required this.type,
    required this.duration,
    required this.calories,
    required this.distance,
    required this.steps,
    required this.notes,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'duration': duration,
      'calories': calories,
      'distance': distance,
      'steps': steps,
      'notes': notes,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Activity.fromMap(Map<String, dynamic> map) {
    return Activity(
      id: map['id'],
      type: map['type'],
      duration: map['duration'],
      calories: map['calories'],
      distance: map['distance'],
      steps: map['steps'],
      notes: map['notes'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
