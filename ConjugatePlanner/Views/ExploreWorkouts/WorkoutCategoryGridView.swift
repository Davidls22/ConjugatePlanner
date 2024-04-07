//
//  WorkoutCategoryGridView.swift
//  ConjugatePlanner
//
//  Created by David Sugden on 06/04/2024.
//

import SwiftUI

struct WorkoutCategoryGridView: View {
  @StateObject private var workoutdata = WorkoutData()
    
    var body: some View {
        let columns = [GridItem(), GridItem()]
        NavigationView {
            ScrollView {
                let columns = [GridItem(), GridItem()]
                LazyVGrid(columns: columns, content: { ForEach(MainInformation.Category.allCases,
                                                               id: \.self) { category in
                    NavigationLink(
                                  destination: WorkoutListView(category: category)
                                    .environmentObject(workoutdata),
                                  label: {
                    CategoryView(category: category)
                                  })
                }
                })
            }
                .navigationTitle("Categories")
            }
        }
}

struct CategoryView: View {
  let category: MainInformation.Category
  
  var body: some View {
    HStack {
      Image(category.rawValue)
            .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 50, height: 50)
        .padding(.horizontal, 10)
        .opacity(0.25)
        Text(category.rawValue)
            .font(.title)
            .padding(.trailing, 5)
                    }
            .frame(height: 300)
           
  }
}

struct WorkoutCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCategoryGridView()
    }
}
