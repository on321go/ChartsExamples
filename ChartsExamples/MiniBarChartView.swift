//
//  MiniBarChartView.swift
//  ChartsExamples
//
//  Created by jrubin on 3/22/24.
//

import SwiftUI
import Charts

struct MiniBarChartView: View {
    
    let data = [ChartData(type: "Ride 1", count: 2595),
                ChartData(type: "RIde 2", count: 4507),
                ChartData(type: "Ride 3", count: 3955),
                ChartData(type: "Ride 4", count: 4995),
    ]
    
    var body: some View {
        
        VStack {
            Text("Max RPM")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.red)
                .font(.title2).bold()
            
            Chart(data) { dataPoint in
                BarMark(
                    x: .value("Ride", dataPoint.type),
                    y: .value("Count", dataPoint.count)
                )
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .clear]), startPoint: .top, endPoint: .bottom))
                .annotation(position: .top, alignment: .top) {
                    Text(dataPoint.count.description)
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
                RuleMark(
                    y: .value("Average RPM", 4013.0)
                      )
                .foregroundStyle(.orange)
            }
            .foregroundStyle(.red)
            //.chartYAxis(.hidden)
            
            
            HStack {
                let average = getAverage()
                Text("Average Max RPM:  \(average)")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundStyle(.orange)
                    //.padding(.bottom, 10)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .foregroundStyle(.orange)
            
            HStack {
                Text("Highest Max RPM:")
                Text("4995.0")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
            .foregroundStyle(.gray)
        }
    }
    
    func getAverage() -> String {
        let total = data.reduce(0) { $0 + $1.count }
        let averageCount = Double(total) / Double(data.count)
        
        return String(averageCount)
    }
}

#Preview {
    MiniBarChartView()
}
