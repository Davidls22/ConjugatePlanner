//
//  ModifyWorkoutView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 07/04/2024.
//

import SwiftUI

struct ModifyWorkoutView: View {
    @Binding var workout: Workout
    
    enum Selection {
        case main
        case exercises
    }
    
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select workout component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Exercises").tag(Selection.exercises)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $workout.mainInformation)
            case .exercises:
                ModifyComponentsView<Exercise, ModifyExerciseView>(components: $workout.exercises)
            }
            Spacer()
        }
    }
}
    

struct ModifyRecipeView_Previews: PreviewProvider {
    @State static var workout = Workout()
    static var previews: some View {
        ModifyWorkoutView(workout: $workout)
    }
}



