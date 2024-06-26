//
//  ModifyComponentsView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 18/04/2024.
//

import SwiftUI

protocol WorkoutComponent: CustomStringConvertible {
    init()
    static func singularName() -> String
    static func pluralName() -> String
}

extension WorkoutComponent {
    static func singularName() -> String {
        String(describing: self).lowercased()
    }
    static func pluralName() -> String {
        singularName() + "s"
    }
}

protocol ModifyComponentView: View {
    associatedtype Component: WorkoutComponent
    init(component: Binding<Component>, createAction: @escaping (Component) -> Void)
}

struct ModifyComponentsView<Component: WorkoutComponent, DestinationView: ModifyComponentView>: View where DestinationView.Component == Component {
    @Binding var components: [Component]
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground

    @State private var newComponent = Component()
    
    var body: some View {
        VStack {
            let addComponentView = DestinationView(component: $newComponent) { component in
                components.append(component)
                newComponent = Component()
            }.navigationTitle("Add \(Component.singularName().capitalized)")
            if components.isEmpty {
                Spacer()
                NavigationLink("Add the first \(Component.singularName())", destination: addComponentView)
                Spacer()
            } else {
                HStack {
                    Text(Component.pluralName().capitalized)
                        .font(.title)
                        .padding()
                    Spacer()
                    EditButton()
                        .padding()
                }
                List {
                    ForEach(components.indices, id: \.self) { index in
                        let component = components[index]
                        let editComponentView = DestinationView(component: $components[index]) { _ in return }
                                                   .navigationTitle("Edit \(Component.singularName().capitalized)")
                                               NavigationLink(component.description, destination: editComponentView)
                                           }
                                           .onDelete { components.remove(atOffsets: $0) }
                                           .onMove { indices, newOffet in components.move(fromOffsets: indices, toOffset: newOffet) }
                                           .listRowBackground(listBackgroundColor)
                                           NavigationLink("Add another \(Component.singularName())",
                                                          destination: addComponentView)
                                               .buttonStyle(PlainButtonStyle())
                                               .listRowBackground(listBackgroundColor)
                                       }.foregroundColor(listTextColor)
                                   }
                               }
                           }
                       }


struct ModifyComponentsView_Previews: PreviewProvider {
    @State static var workout = Workout.testWorkouts[1]
    @State static var emptyExercises = [Exercise]()
    static var previews: some View {
        NavigationView {
            ModifyComponentsView<Exercise, ModifyExerciseView>(components: $workout.exercises)
        }
        NavigationView {
            ModifyComponentsView<Exercise, ModifyExerciseView>(components: $emptyExercises)
        }
    }
}
