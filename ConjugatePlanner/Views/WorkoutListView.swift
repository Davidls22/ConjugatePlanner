//
//  ContentView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import SwiftUI

struct WorkoutListView: View {
    @EnvironmentObject private var workoutData: WorkoutData
    let category: MainInformation.Category
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        List {
            ForEach(workouts) { workout in
                NavigationLink(workout.mainInformation.name, destination: WorkoutDetailView(workout: workout))
            }
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}


    extension WorkoutListView {
        private var workouts: [Workout] {
            workoutData.workouts(for: category)
        }
    

    private var navigationTitle: String {
        "\(category.rawValue) Workouts"
    }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListView(category: .maxEffort)
                    .environmentObject(WorkoutData())
        }
    }
}
