double estimateCaloriesBurned(int footsteps) {
  // MET value for walking
  double caloriesBurned = footsteps * 0.05;

  return double.parse(caloriesBurned.toStringAsFixed(3));
}
