//
//  ModifyExerciseView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 18/04/2024.
//

import SwiftUI

struct ModifyExerciseView: ModifyComponentView {
    
    @Binding var exercise: Exercise
    let createAction: ((Exercise) -> Void)
    
    init(component: Binding<Exercise>, createAction: @escaping (Exercise) -> Void) {
            self._exercise = component
            self.createAction = createAction
        }
    
    private let listBackgroundColor = Color.gray
    private let listTextColor = Color.black
    
    @Environment(\.presentationMode) private var mode
    
    var body: some View {
        Form {
            TextField("Exercise Name", text: $exercise.name)
                .listRowBackground(listBackgroundColor)
            Stepper(value: $exercise.sets, in: 0...100) {
                Text("Sets: \(exercise.sets)")
            }
            .listRowBackground(listBackgroundColor)
            Stepper(value: $exercise.reps, in: 0...100) {
                Text("Reps: \(exercise.reps)")
            }
            .listRowBackground(listBackgroundColor)
            Picker("Weight Unit", selection: $exercise.weightUnit) {
                ForEach(WeightUnit.allCases, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())

            TextField("Weight", value: $exercise.weight, formatter: NumberFormatter.decimal)
                .listRowBackground(listBackgroundColor)
            TextField("Rest Time", text: $exercise.restTime)
                .listRowBackground(listBackgroundColor)
            TextField("Notes", text: $exercise.notes)
                .listRowBackground(listBackgroundColor)
            HStack {
                Spacer()
                Button("Save") {
                    createAction(exercise)
                    mode.wrappedValue.dismiss()

                }
                Spacer()
            }
            .listRowBackground(listBackgroundColor)
        }
        .background(listBackgroundColor)
        .foregroundColor(listTextColor)
    }
}



extension NumberFormatter {
    static var decimal: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}

struct ModifyExerciseView_Previews: PreviewProvider {
    @State static var workout = Workout.testWorkouts[0]
    static var previews: some View {
        NavigationView {
            ModifyExerciseView(component: $workout.exercises[0]) { exercise in
                print(exercise)
            }.navigationTitle("Add Exercise")
        }
    }
}
