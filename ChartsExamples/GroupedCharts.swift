//
//  GroupedCharts.swift
//  ChartsExamples
//
//  Created by jrubin on 3/21/24.
//

import SwiftUI

struct GroupedCharts: View {
    var body: some View {
        ScrollView {
            
            
            //GroupBox ( "Bar Chart - Step count") {
            VStack {
                
                GroupBox{
                    BarChartVerticle()
                }
                    
                GroupBox{
                    BarChartHorizontal()
                }
                    
                GroupBox{
                    AreaChart()
                }
            }
        }
        .padding()
    }
}

#Preview {
    GroupedCharts()
}
