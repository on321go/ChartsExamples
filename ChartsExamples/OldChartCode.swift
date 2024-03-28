//
//  OldChartCode.swift
//  ChartsExamples
//
//  Created by jrubin on 3/21/24.
//

import SwiftUI
import Charts

struct StepCount: Identifiable {
    let id = UUID()
    let weekday: Date
    let steps: Int
    init(day: String, steps: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.weekday = formatter.date(from: day) ?? Date.distantPast
        self.steps = steps
    }
}

struct LineDataPoint: Identifiable {
    let id = UUID()
    let date: Date
    let value: Int
    
    init(day: String, value: Int) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        self.date = formatter.date(from: day) ?? Date.distantPast
        self.value = value
    }
}

struct OldChartCode: View {

    struct StepCountData: Identifiable {
        let id = UUID() // Conform to Identifiable
        let stepCount: StepCount
        let week: String
    }

    struct bikeDataPoint: Identifiable {
        let id = UUID()
        let ride: Int
        let date: Date
        //all senor data? Or one for all?
    }
    
    let previousWeek: [StepCount] = [
               StepCount(day: "20220710", steps: 15800),
               StepCount(day: "20220711", steps: 7300),
               StepCount(day: "20220712", steps: 8200),
               StepCount(day: "20220713", steps: 25600),
               StepCount(day: "20220714", steps: 16100),
               StepCount(day: "20220715", steps: 16500),
               StepCount(day: "20220716", steps: 3200)
           ]
    let currentWeek: [StepCount] = [
               StepCount(day: "20220717", steps: 4200),
               StepCount(day: "20220718", steps: 15000),
               StepCount(day: "20220719", steps: 2800),
               StepCount(day: "20220720", steps: 10800),
               StepCount(day: "20220721", steps: 5300),
               StepCount(day: "20220722", steps: 10400),
               StepCount(day: "20220723", steps: 4000)
           ]
       
    
    var combinedData: [StepCountData] {
           let previousData = previousWeek.map { StepCountData(stepCount: $0, week: "Previous") }
           let currentData = currentWeek.map { StepCountData(stepCount: $0, week: "Current") }
           return previousData + currentData
       }
    
    var combinedData2: [StepCountData] {
        let sortedPreviousWeek = previousWeek.sorted { $0.weekday < $1.weekday }
        let sortedCurrentWeek = currentWeek.sorted { $0.weekday < $1.weekday }
        var combined: [StepCountData] = []
        
        for (previous, current) in zip(sortedPreviousWeek, sortedCurrentWeek) {
            combined.append(StepCountData(stepCount: previous, week: "Previous"))
            combined.append(StepCountData(stepCount: current, week: "Current"))
        }
        
        return combined
    }
    
    let data = [
        (name: "Cachapa", sales: 9631),
        (name: "Crêpe", sales: 6959),
        (name: "Injera", sales: 4891),
        (name: "Jian Bing", sales: 2506),
        (name: "American", sales: 1777),
        (name: "Dosa", sales: 625),
    ]
    
    let lineData1: [LineDataPoint] = [
        LineDataPoint(day: "20240202", value: 50),
        LineDataPoint(day: "20240203", value: 550),
        LineDataPoint(day: "20240204", value: 250),
        LineDataPoint(day: "20240205", value: 750),
        LineDataPoint(day: "20240206", value: 450),
        LineDataPoint(day: "20240207", value: 950),
        LineDataPoint(day: "20240208", value: 150),
        LineDataPoint(day: "20240210", value: 1550)
        ]
    
        let lineData2: [LineDataPoint] = [
            LineDataPoint(day: "20240202", value: 50),
            LineDataPoint(day: "20240203", value: 1150),
            LineDataPoint(day: "20240204", value: 50),
            LineDataPoint(day: "20240205", value: 1250),
            LineDataPoint(day: "20240206", value: 50),
            LineDataPoint(day: "20240207", value: 450),
            LineDataPoint(day: "20240208", value: 950),
            LineDataPoint(day: "20240209", value: 250),
            LineDataPoint(day: "20240210", value: 950)
        ]
    
    
//    let stepData = [
//        (period: "Current Week", data: currentWeek),
//        (period: "Previous Week", data: previousWeek)
//    ]
    var body: some View {
       
        ScrollView {

            
            //GroupBox ( "Bar Chart - Step count") {
//                VStack {
//                    GroupBox {
//                        BarChartVerticle()
//                    }
//                    Divider()
//                       
//                    BarChartHorizontal()
//                    
//                    Divider()
//                        
//                    LineChart()
//                        
//                }
                
            //}
            
            GroupBox("Bar Chart - Combined Data") { //Grey background
                Chart(combinedData) { item in
                    BarMark(
                        x: .value("Week Day", item.stepCount.weekday, unit: .day),
                        y: .value("Step Count", item.stepCount.steps)
                    )
                    .foregroundStyle(item.week == "Current" ? .red : .gray)
                }
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day)) { _ in
                        AxisValueLabel(format: .dateTime.weekday(.abbreviated))
                    }
                }
                HStack {
                    Text("Additional data here:")
                    Text(" 987654")
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
            
        
           
            LineChartView(lineData1: lineData1, lineData2: lineData2)
                .frame(height: 300)
            LineChart()
                .frame(height: 300)
                        
//                        GroupBox ( "Point Chart - Step count") {
//                            Chart(currentWeek) {
//                                PointMark(
//                                    x: .value("Week Day", $0.weekday, unit: .day),
//                                    y: .value("Step Count", $0.steps)
//                                )
//                            }
//                        }
//
//                        GroupBox ( "Rectangle Chart - Step count") {
//                            Chart(currentWeek) {
//                                RectangleMark(
//                                    x: .value("Week Day", $0.weekday, unit: .day),
//                                    y: .value("Step Count", $0.steps)
//                                )
//                            }
//                        }
                        
//                        GroupBox ( "Area Chart - Step count") {
//                            Chart(data, id: \.name) { name, sales in
//                                   SectorMark(
//                                       angle: .value("Value", sales),
//                                       innerRadius: .ratio(0.618),
//                                       outerRadius: .inset(10),
//                                       angularInset: 1
//                                   )
//                                   .cornerRadius(4)
//                                   .foregroundStyle(by: .value("Product category", name))
//                                   //.annotation(position: .automatic, alignment: .center) {
////                                       Text("Anotate")
////                                   }
//                                   
//                               }
//                            .padding(.bottom, 5)
//                            
//                            ForEach(data, id: \.name) { item in
//                                HStack {
//                                    Text("\(item.name)")
//                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
//                                    Text("\(item.sales)")
//                                        .padding(.leading, 40)
//                                }
//                                
//                                
//                                    }
//                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
//                            
//                        }
//                        .frame(height: 600)
            
           
                //GroupBox ("Stats") {
                    ForEach(data, id: \.name) { item in
                        HStack {
                            Text("\(item.name)")
                                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .leading)
                            Text("\(item.sales)")
                                .padding(.leading, 40)
                        }
                        
                            }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.horizontal, 10)
               // }
            
        
                    
        }
        .padding()
    }
    
}

#Preview {
    OldChartCode()
}

struct LineChartView: View {
    var lineData1: [LineDataPoint]
    var lineData2: [LineDataPoint]
    let thresholdValue: Int = 700 // Example threshold value

    var body: some View {
        
        GroupBox ("Layered Stats"){
            Chart {
                ForEach(lineData1) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Value", point.value),
                        series: .value("Company", "A")
                    )
                
                    .foregroundStyle(.yellow)
                }
                
                ForEach(lineData2) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Value", point.value),
                        series: .value("Company", "B")
                    )
                    .foregroundStyle(.red)
                    .symbol(by: .value("Value", point.value))
                    .foregroundStyle(by: .value("Value", point.value))
                    
                    PointMark(
                        x: .value("Date", point.date),
                        y: .value("Value", point.value)
                    )
                    .foregroundStyle(.red)
                    .annotation(position: .top, alignment: .top) {
                        Text(point.value.description)
                            .foregroundStyle(.red)
                            .font(.caption)
                    }
                    
                    
                }
                RuleMark(y: .value("Threshold", thresholdValue))
                    .foregroundStyle(.orange)
//                    .annotation(position: .automatic, alignment: .leading) {
//                        Text(".average")
//                            .foregroundStyle(.white)
//                    }
            }
            .chartXAxis {
                AxisMarks(values: .stride(by: .day)) { _ in
                    AxisValueLabel(format: .dateTime.day().month(), centered: true)
                }
            }
            .symbolVariant(.square)
        }
    }
}
