//
//  Workout.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import Foundation

struct WorkoutPlan {
    var mainInformation: MainInformation
    var exercises: [Exercise]
    
    init(mainInformation: MainInformation, exercises: [Exercise]) {
        self.mainInformation = mainInformation
        self.exercises = exercises
    }
    
    init() {
        self.init(mainInformation: MainInformation(name: "", description: "", author: "", category: .maxEffort), exercises: [])
    }
}

struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category
    
    enum Category: String, CaseIterable {
        case maxEffort = "Max Effort"
        case dynamicEffort = "Dynamic Effort"
        case repetitionEffort = "Repetition Effort"
        case accessory = "Accessory"
    }
    
    init(name: String, description: String, author: String, category: Category) {
        self.name = name
        self.description = description
        self.author = author
        self.category = category
    }
    
    init() {
        self.init(name: "", description: "", author: "", category: .maxEffort)
    }
}

struct Exercise {
    var name: String
    var sets: Int // Number of sets
    var reps: Int // Number of repetitions
    var intensity: String // Weight, Time, Distance, etc.
    var restTime: String // Rest time between sets
    var notes: String // Additional notes for the exercise
}
