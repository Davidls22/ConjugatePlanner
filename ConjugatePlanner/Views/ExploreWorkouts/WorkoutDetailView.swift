//
//  WorkoutDetailView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    @Binding var workout: Workout
    @State private var isPresenting = false
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        VStack {
            HStack{
                Text("Author: \(workout.mainInformation.author)")
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            HStack {
                Text(workout.mainInformation.description)
                    .font(.subheadline)
                    .padding()
                Spacer()
            }
            List {
                Section(header: Text("Exercises")) {
                    ForEach(workout.exercises, id: \.self) { exercise in
                        VStack(alignment: .leading) {
                            Text(exercise.name)
                                .font(.headline)
                            Text("Sets: \(exercise.sets)")
                            Text("Reps: \(exercise.reps)")
                            Text("Weight: \(exercise.weight) \(exercise.weightUnit.rawValue)")
                            Text("Rest Time: \(exercise.restTime)")
                            Text("Notes: \(exercise.notes)")
                        }
                        .foregroundColor(listTextColor)
                        .padding(.vertical, 4)
                    }.listRowBackground(listBackgroundColor)
                }
            }
        }

        .navigationTitle(workout.mainInformation.name)
        .toolbar {
                ToolbarItem {
                  HStack {
                    Button("Edit") {
                      isPresenting = true
                    }
                  }
                }
            ToolbarItem(placement: .navigationBarLeading) { Text("") }
              }
              
              .sheet(isPresented: $isPresenting) {
                NavigationView {
                  ModifyWorkoutView(workout: $workout)
                    .toolbar {
                      ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                          isPresenting = false
                        }
                      }
                    }
                    .navigationTitle("Edit Workout")
                }
              }
          }
        }

struct WorkoutDetailView_Previews: PreviewProvider {
  @State static var workout = Workout.testWorkouts[0]
  static var previews: some View {
    NavigationView {
      WorkoutDetailView(workout: $workout)
    }
  }
}
