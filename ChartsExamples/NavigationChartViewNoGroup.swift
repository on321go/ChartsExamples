//
//  NavigationChartViewNoGroup.swift
//  ChartsExamples
//
//  Created by jrubin on 3/22/24.
//

import SwiftUI
import Charts

struct NavigationChartViewNoGroup: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                NavigationLink(destination: BarChartVerticle()) {
                        MiniBarChartView()
                }
                .padding()
                
                Divider()
                    .background(Color(.white))
                    //.padding(.vertical)
                
                NavigationLink(destination: BarChartHorizontal()) {
                        MiniBarChartHorizontal()
                }
                .padding()
                
                
                Divider()
                    .background(Color(.white))
                    //.padding(.vertical)
                
                NavigationLink(destination: AreaChart()) {
                        MiniAreaChart()
                }
                .padding()
                
                NavigationLink(destination: LineChart()) {
                        MiniLineChart()
                }
                .padding()
            }
        }
       
    }
}

#Preview {
    NavigationChartViewNoGroup()
}
