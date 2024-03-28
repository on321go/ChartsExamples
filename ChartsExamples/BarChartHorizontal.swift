//
//  BarChartHorizontal.swift
//  ChartsExamples
//
//  Created by jrubin on 3/21/24.
//

import SwiftUI
import Charts

struct BarChartHorizontal: View {
    
    
        let thresholdValue = 88
    
        var body: some View {
            
            VStack {
                Text("Max MPH")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundStyle(.red)
                    .font(.title2).bold()
                
                Chart(mphData) { dataPoint in
                    BarMark(
                        x: .value("Count", dataPoint.count),
                        y: .value("Ride", dataPoint.type)
                    )
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.red, .clear]), startPoint: .trailing, endPoint: .leading))
                    .annotation(position: .trailing, alignment: .trailing) {
                        Text(dataPoint.count.description)
                            .foregroundStyle(.gray)
                            .font(.caption)
                    }
                    RuleMark(
                              x: .value("Average Count", 88)
                          )
                          .lineStyle(StrokeStyle(lineWidth: 2, dash: [5]))
                          .foregroundStyle(.orange)
                }
                .foregroundStyle(.red)
                .padding(.bottom, 5)
                //.aspectRatio(contentMode: .fit)
               
                
                let average = getAverage()
                Text("Average Max MPH:  \(average)")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .foregroundStyle(.orange)
                    //.padding(.bottom, 10)
                
                HStack {
                    Text("Highest Max RPM:")
                    Text("107.0")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
                .foregroundStyle(.gray)
            }
            .padding()
        
    }
    
    func getAverage() -> String {
        let total = mphData.reduce(0) { $0 + $1.count }
        let averageCount = Double(total) / Double(mphData.count)
        
        return String(averageCount)
    }
}

#Preview {
    BarChartHorizontal()
}
