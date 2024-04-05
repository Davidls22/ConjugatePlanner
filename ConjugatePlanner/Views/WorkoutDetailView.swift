//
//  WorkoutDetailView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 05/04/2024.
//

import SwiftUI

struct WorkoutDetailView: View {
    let workout: Workout
    
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
        }
        .navigationTitle(workout.mainInformation.name)
    }
}

struct WorkoutDetailView_Previews: PreviewProvider {
  @State static var workout = Workout.testWorkouts[0]
  static var previews: some View {
    NavigationView {
      WorkoutDetailView(workout: workout)
    }
  }
}
