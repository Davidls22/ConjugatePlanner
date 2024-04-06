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
    ZStack {
      Image(category.rawValue)
            .resizable()
        .aspectRatio(contentMode: .fit)
        .opacity(0.25)
        Text(category.rawValue)
          .font(.title)
    }
      
  }
}

struct WorkoutCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutCategoryGridView()
    }
}
