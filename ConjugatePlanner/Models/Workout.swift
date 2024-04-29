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
    
    init() {
        self.init(mainInformation: MainInformation(name: "", description: "", author: "", category: .maxEffortUpper), exercises: [])
    }
    
    init(mainInformation: MainInformation, exercises: [Exercise]) {
        self.mainInformation = mainInformation
        self.exercises = exercises
    }
    
    var isValid: Bool {
       mainInformation.isValid && !exercises.isEmpty
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
    
    var isValid: Bool {
        !name.isEmpty && !description.isEmpty && !author.isEmpty
      }
    }


struct Exercise: WorkoutComponent, CustomStringConvertible, Hashable {
    var name: String
    var sets: Int // Number of sets
    var reps: Int // Number of repetitions
    var restTime: String // Rest time between sets
    var notes: String // Additional notes for the exercise
    var weight: Double // Weight lifted
    var weightUnit: WeightUnit // Weight unit (kg or lbs)
    
    // Initializer required by WorkoutComponent protocol
    init() {
        self.init(name: "", sets: 0, reps: 0, restTime: "", notes: "", weight: 0.0, weightUnit: .kg)
    }
    
    // Initializer with default parameter values for flexibility
    init(name: String = "", sets: Int = 0, reps: Int = 0, restTime: String = "", notes: String = "", weight: Double = 0.0, weightUnit: WeightUnit = .kg) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.restTime = restTime
        self.notes = notes
        self.weight = weight
        self.weightUnit = weightUnit
    }
    
    // CustomStringConvertible implementation
    var description: String {
        return "Exercise: \(name), Sets: \(sets), Reps: \(reps), Rest Time: \(restTime), Notes: \(notes), Weight: \(weight) \(weightUnit.rawValue)"
    }
}

enum WeightUnit: String, CaseIterable {
    case kg = "kg"
    case lbs = "lbs"
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
                    restTime: "2 minutes",
                    notes: "Increase weight each set"
                ),
                Exercise(
                    name: "Pull-ups",
                    sets: 4,
                    reps: 8,
                    restTime: "90 seconds",
                    notes: "Add weight if possible"
                ),
                Exercise(
                    name: "Rows",
                    sets: 3,
                    reps: 10,
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
                          restTime: "2 minutes",
                          notes: "Use a challenging height"
                      ),
                      Exercise(
                          name: "Deadlifts",
                          sets: 6,
                          reps: 3,
                          restTime: "3 minutes",
                          notes: "Focus on speed and form"
                      ),
                      Exercise(
                          name: "Romanian Deadlifts",
                          sets: 4,
                          reps: 8,
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
                          restTime: "60 seconds",
                          notes: "Focus on squeezing at the top"
                      ),
                      Exercise(
                          name: "Tricep Extensions",
                          sets: 4,
                          reps: 12,
                          restTime: "60 seconds",
                          notes: "Controlled eccentric phase"
                      ),
                      Exercise(
                          name: "Calf Raises",
                          sets: 3,
                          reps: 15,
                          restTime: "45 seconds",
                          notes: "Full range of motion"
                      )
                  ]
              )
    ]
}
