//
//  AreaChart.swift
//  ChartsExamples
//
//  Created by jrubin on 3/22/24.
//

//
//  LineChart.swift
//  ChartsExamples
//
//  Created by jrubin on 3/21/24.
//

import SwiftUI
import Charts

struct AreaChart: View {
    
    let data = [ChartData(type: "Ride 1", count: 95),
                ChartData(type: "RIde 2", count: 207),
                ChartData(type: "Ride 3", count: 165),
                ChartData(type: "Ride 4", count: 185),
    ]
    var body: some View {
        
        VStack {
            Text("Max Horse Power")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(.red)
                .font(.title2).bold()
            
            Chart(data) { dataPoint in
                AreaMark(
                    x: .value("Ride", dataPoint.type),
                    y: .value("Count", dataPoint.count)
                )
                .foregroundStyle(
                    LinearGradient(gradient: Gradient(colors: [.red, .clear]), startPoint: .top, endPoint: .bottom)
                )
                PointMark(
                    x: .value("Ride", dataPoint.type),
                    y: .value("Count", dataPoint.count)
                )
                .foregroundStyle(.orange)
                .annotation(position: .top, alignment: .top) {
                    Text(dataPoint.count.description)
                        .foregroundStyle(.yellow)
                        .font(.caption)
                }
                
               
                // .foregroundStyle(Color.black)//also line
                
                RuleMark(
                    y: .value("Average Count", 163)
                )
                .foregroundStyle(.orange)
            }
            .foregroundColor(.red) //line
            //.background(Color.cyan) // chart background
            
            HStack {
                let average = getAverage()
                Text("Average Max Horse Power:  \(average)")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundStyle(.orange)
                    //.padding(.bottom, 10)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .foregroundStyle(.orange)
            
            HStack {
                Text("Highest Max Horse Power:")
                Text("207.0")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 20)
            .foregroundStyle(.gray)
        }
        .padding()
        
    }
    func getAverage() -> String {
        let total = data.reduce(0) { $0 + $1.count }
        let averageCount = Double(total) / Double(data.count)
        
        return String(averageCount)
    }
}

#Preview {
    AreaChart()
}
