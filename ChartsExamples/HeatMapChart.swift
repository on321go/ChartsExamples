//
//  HeatMapChart.swift
//  ChartsExamples
//
//  Created by jrubin on 3/25/24.
//

import SwiftUI
import Charts
//
//struct MatrixEntry: Identifiable {
//    var id = UUID()
//    
//    var positive: String
//    var negative: String
//    var num: Double
//}
//
//
//var data: [MatrixEntry] = [
//    MatrixEntry(positive: "+", negative: "+", num: 125),
//    MatrixEntry(positive: "+", negative: "-", num: 10),
//    MatrixEntry(positive: "-", negative: "-", num: 80),
//    MatrixEntry(positive: "-", negative: "+", num: 1)
//]
//
struct ChartView: View {
//    
//    var body: some View {
//        Chart(data) { data in
//                RectangleMark(
//                    x: .value("Positive", data.positive),
//                    y: .value("Negative", data.negative)
//                )
//                .foregroundStyle(by: .value("Number", data.num))
//            }
//    }
    
    let data: [HeatData] = HeatData.exampleData

        var body: some View {
            VStack {
                Chart {
                    ForEach(data) { datum in
                        RectangleMark(
                            x: .value("X Location", datum.locationX),
                            y: .value("Y Location", datum.locationY)
                        )
                        .foregroundStyle(self.colorForTemperature(datum.temperatur))
                    }
                }
                .chartXAxis {
                    AxisMarks(preset: .automatic, position: .bottom)
                }
                .chartYAxis {
                    AxisMarks(preset: .automatic, position: .leading)
                }
            }
            .padding()
        }

        private func colorForTemperature(_ temperature: Double) -> Color {
            let normalizedTemperature = (temperature - 10) / (30 - 10) // Adjust based on your data range
            return Color(hue: 1.0 - normalizedTemperature, saturation: 0.8, brightness: 0.8)
        }
    }






#Preview {
    ChartView()
}
