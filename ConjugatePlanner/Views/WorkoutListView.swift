//
//  ContentView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import SwiftUI

struct WorkoutListView: View {
    @StateObject var workoutData = WorkoutData()
    
    var body: some View {
        List {
                   ForEach(workouts) { workout in
                       NavigationLink(workout.mainInformation.name, destination: WorkoutDetailView(workout: workout))
                   }
               }
               .navigationTitle(navigationTitle)
           }
}

extension WorkoutListView {
  var workouts: [Workout] {
    workoutData.workouts
  }
  
  var navigationTitle: String {
    "All Workouts"
  }
}

struct WorkoutListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            WorkoutListView()
        }
    }
}
