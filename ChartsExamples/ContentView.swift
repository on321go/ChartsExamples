//
//  ContentView.swift
//  ChartsExamples
//
//  Created by jrubin on 3/15/24.
//

import SwiftUI
import Charts



struct ContentView: View {
    @State private var selectedTab = "plus"

    var body: some View {
        
        TabView(selection: $selectedTab)  {
               
            
            NavigationChartViewNoGroup()
                .tabItem {
                      Image(systemName: "person.fill.badge.plus")
                      Text("Plus")
                    }
                .tag("plus")
            
            NavigationChartView()
                .tabItem {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                    Text("Group Plus")
                }
                .tag("groupPlus")
                 
            OldChartCode()
                .tabItem {
                  Image(systemName: "folder")
                  Text("Other")
                }
                .tag("other")
        }
        .navigationViewStyle(StackNavigationViewStyle())
       
    }
    
}


#Preview {
    ContentView()
}
