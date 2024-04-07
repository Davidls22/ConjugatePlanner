//
//  Workout.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import Foundation

struct Workout: Identifiable {
    var id = UUID()
    
    
    var mainInformation: MainInformation
    var exercises: [Exercise]
    
    init(mainInformation: MainInformation, exercises: [Exercise]) {
        self.mainInformation = mainInformation
        self.exercises = exercises
    }
    
    init() {
        self.init(mainInformation: MainInformation(name: "", description: "", author: "", category: .maxEffortUpper), exercises: [])
    }
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category
    
    enum Category: String, CaseIterable {
        case maxEffortUpper = "Max Effort Upper"
        case dynamicEffortUpper = "Dynamic Effort Upper"
        case maxEffortLower = "Max Effort Lower"
        case dynamicEffortLower = "Dynamic Effort Lower"
    }
    
    init(name: String, description: String, author: String, category: Category) {
        self.name = name
        self.description = description
        self.author = author
        self.category = category
    }
    
    init() {
        self.init(name: "", description: "", author: "", category: .maxEffortUpper)
    }
}

struct Exercise: Hashable {
    var name: String
    var sets: Int // Number of sets
    var reps: Int // Number of repetitions
    var intensity: String // Weight, Time, Distance, etc.
    var restTime: String // Rest time between sets
    var notes: String // Additional notes for the exercise
}

extension Workout {
    static let testWorkouts: [Workout] = [
        Workout(
            mainInformation: MainInformation(
                name: "Max Effort Upper",
                description: "A workout focusing on heavy lifts for the upper body",
                author: "John Doe",
                category: .maxEffortUpper
            ),
            exercises: [
                Exercise(
                    name: "Bench Press",
                    sets: 5,
                    reps: 5,
                    intensity: "Heavy",
                    restTime: "2 minutes",
                    notes: "Increase weight each set"
                ),
                Exercise(
                    name: "Pull-ups",
                    sets: 4,
                    reps: 8,
                    intensity: "Bodyweight",
                    restTime: "90 seconds",
                    notes: "Add weight if possible"
                ),
                Exercise(
                    name: "Rows",
                    sets: 3,
                    reps: 10,
                    intensity: "Moderate",
                    restTime: "60 seconds",
                    notes: "Focus on form"
                )
            ]
        ),
        Workout(
                  mainInformation: MainInformation(
                      name: "Dynamic Effort Lower",
                      description: "A workout focusing on explosive lifts for the lower body",
                      author: "Jane Smith",
                      category: .dynamicEffortLower
                  ),
                  exercises: [
                      Exercise(
                          name: "Box Jumps",
                          sets: 5,
                          reps: 5,
                          intensity: "Explosive",
                          restTime: "2 minutes",
                          notes: "Use a challenging height"
                      ),
                      Exercise(
                          name: "Deadlifts",
                          sets: 6,
                          reps: 3,
                          intensity: "Moderate to Heavy",
                          restTime: "3 minutes",
                          notes: "Focus on speed and form"
                      ),
                      Exercise(
                          name: "Romanian Deadlifts",
                          sets: 4,
                          reps: 8,
                          intensity: "Moderate",
                          restTime: "90 seconds",
                          notes: "Controlled eccentric phase"
                      )
                  ]
              ),
              Workout(
                  mainInformation: MainInformation(
                      name: "Max Effort Lower",
                      description: "A workout focusing on accessory exercises",
                      author: "Alice Johnson",
                      category: .maxEffortLower
                  ),
                  exercises: [
                      Exercise(
                          name: "Bicep Curls",
                          sets: 4,
                          reps: 12,
                          intensity: "Light to Moderate",
                          restTime: "60 seconds",
                          notes: "Focus on squeezing at the top"
                      ),
                      Exercise(
                          name: "Tricep Extensions",
                          sets: 4,
                          reps: 12,
                          intensity: "Light to Moderate",
                          restTime: "60 seconds",
                          notes: "Controlled eccentric phase"
                      ),
                      Exercise(
                          name: "Calf Raises",
                          sets: 3,
                          reps: 15,
                          intensity: "Light to Moderate",
                          restTime: "45 seconds",
                          notes: "Full range of motion"
                      )
                  ]
              )
    ]
}
