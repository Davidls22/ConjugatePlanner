//
//  WorkoutData.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import Foundation

class WorkoutData: ObservableObject {
    @Published var workouts = Workout.testWorkouts
    
    func workouts(for category: MainInformation.Category) -> [Workout] {
        var filteredWorkouts = [Workout]()
        for workout in workouts {
            if workout.mainInformation.category == category {
                filteredWorkouts.append(workout)
            }
        }
        return filteredWorkouts
    }
    func add(workout: Workout) {
            if workout.isValid {
                workouts.append(workout)
            }
        }
}
