//
//  ModifyMainInformationView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 18/04/2024.
//

import SwiftUI

struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Workout Name", text: $mainInformation.name)
                .listRowBackground(listBackgroundColor)
            TextField("Author", text: $mainInformation.author)
                .listRowBackground(listBackgroundColor)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
                .listRowBackground(listBackgroundColor)            }
            Picker(selection: $mainInformation.category, label:
                    HStack {
                Text("Category")
                Spacer()
                Text(mainInformation.category.rawValue)
            }) {
                ForEach(MainInformation.Category.allCases,
                        id: \.self) { category in
                    Text(category.rawValue)
                }
            }
            .listRowBackground(listBackgroundColor)
            .pickerStyle(MenuPickerStyle())
        }
        .foregroundColor(listTextColor)
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                           description: "Test Description",
                                                           author: "Test Author",
                                                           category: .maxEffortUpper)
       @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .maxEffortUpper)
           
       static var previews: some View {
           ModifyMainInformationView(mainInformation: $mainInformation)
           ModifyMainInformationView(mainInformation: $emptyInformation)

    }
}
