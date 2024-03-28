//
//  NavigationChartView.swift
//  ChartsExamples
//
//  Created by jrubin on 3/22/24.
//

import SwiftUI

struct NavigationChartView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                
                NavigationLink(destination: BarChartVerticle()) {
                    
                    GroupBox {
                        MiniBarChartView()
                    }
                }
                
                NavigationLink(destination: BarChartHorizontal()) {
                    
                    GroupBox {
                        MiniBarChartHorizontal()
                    }
                }
            
                NavigationLink(destination: AreaChart()) {
                    
                    GroupBox {
                        MiniAreaChart()
                    }
                }
                
                NavigationLink(destination: LineChart()) {
                    
                    GroupBox {
                        MiniLineChart()
                    }
                }
            }
        }
        .padding()
    }
}


#Preview {
    NavigationChartViewNoGroup()
}



