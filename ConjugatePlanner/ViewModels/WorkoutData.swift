//
//  WorkoutData.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import Foundation

class WorkoutData: ObservableObject {
  @Published var workouts = Workout.testWorkouts
}
