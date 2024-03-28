//
//  LineChart.swift
//  ChartsExamples
//
//  Created by jrubin on 3/21/24.
//

import SwiftUI
import Charts

struct LineChart: View {
    let thresholdValue: Int = 70 // Example threshold value
    
    var body: some View {
        VStack {
            Text("Miles Riden by Month")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .foregroundStyle(.red)
                .font(.title2).bold()
            Chart {
                ForEach(collection1, id: \.type) { point in
                    LineMark(
                        x: .value("Date", point.type),
                        y: .value("Value", point.count),
                        series: .value("Series", "January")
                    )
                    .foregroundStyle(.yellow)
                    
                    
                    PointMark(
                        x: .value("Date", point.type),
                        y: .value("Value", point.count)
                    )
                    .foregroundStyle(.yellow)
                    .annotation(position: .top, alignment: .top) {
                        Text(point.count.description)
                            .foregroundStyle(.yellow)
                            .font(.caption)
                    }
                   
                }
                .foregroundStyle(.yellow)
                //.foregroundStyle(by: .value("Month", "January"))
                
                
                ForEach(collection2, id: \.type) { point in
                    LineMark(
                        x: .value("Date", point.type),
                        y: .value("Value", point.count),
                        series: .value("Series", "April")
                    )
                    //.foregroundStyle(.red)
                    
                    
                    PointMark(
                        x: .value("Date", point.type),
                        y: .value("Value", point.count)
                    )
                    
                    .annotation(position: .top, alignment: .top) {
                        Text(point.count.description)
                            .foregroundStyle(.red)
                            .font(.caption)
                    }
                }
                .foregroundStyle(.red)
                
                //                RuleMark(y: .value("Threshold", thresholdValue))
                //                    .foregroundStyle(.orange)
                //                    .annotation(position: .automatic, alignment: .leading) {
                //                        Text(".average")
                //                            .foregroundStyle(.white)
                //                    }
                
                //            .chartXAxis {
                //                AxisMarks(values: .stride(by: .day)) { _ in
                //                    AxisValueLabel(format: .dateTime.day().month(), centered: true)
                //                }
                //            }
                
            }
            .chartForegroundStyleScale([
                "January": .red,
                "April": .yellow
                // Add more mappings as needed
            ])
            
        }
        .padding()
    }
}

#Preview {
    LineChart()
}
