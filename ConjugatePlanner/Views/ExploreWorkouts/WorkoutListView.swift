//
//  ContentView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import SwiftUI

struct WorkoutListView: View {
    @EnvironmentObject var workoutData: WorkoutData
    let category: MainInformation.Category
    
    @State private var isPresenting = false
    @State private var newWorkout = Workout()
    
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
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
                .sheet(isPresented: $isPresenting, content: {
                    NavigationView {
                        ModifyWorkoutView(workout: $newWorkout)
                            .toolbar(content: {
                                            ToolbarItem(placement: .cancellationAction) {
                                              Button("Dismiss") {
                                                isPresenting = false
                                              }
                                            }
                                            ToolbarItem(placement: .confirmationAction) {
                                              Button("Add") {
                                                workoutData.workouts.append(newWorkout)
                                                isPresenting = false
                                              }
                                            }
                                          })
                            .navigationTitle("Add a New Workout")
                    }
                })
            }
        })
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
            WorkoutListView(category: .maxEffortUpper)
                    .environmentObject(WorkoutData())
        }
    }
}
