//
//  ModifyWorkoutView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 07/04/2024.
//

import SwiftUI

struct ModifyWorkoutView: View {
    @Binding var workout : Workout
    
    var body: some View {
        VStack {
            Button("Fill in the workout with test data.") {
                workout.mainInformation = MainInformation(
                    name: "test",
                    description: "test",
                    author: "test",
                    category: .maxEffortLower
                )
                workout.exercises = [
                    Exercise(
                        name: "Exercise 1",
                        sets: 3,
                        reps: 10,
                        intensity: "Medium",
                        restTime: "60 seconds",
                        notes: "Some notes"
                    )
                ]
            }
        }
    }
    
    
    struct ModifyWorkoutView_Previews: PreviewProvider {
        @State static var workout = Workout()
        static var previews: some View {
            ModifyWorkoutView(workout: $workout)
            
        }
    }
}
