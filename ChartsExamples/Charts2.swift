//
//  Charts2.swift
//  ChartsExamples
//
//  Created by jrubin on 3/18/24.
//

import SwiftUI
import Charts



let currentWeek: [StepCount] = [
    StepCount(day: "20220717", steps: 4200),
    StepCount(day: "20220718", steps: 15000),
    StepCount(day: "20220719", steps: 2800),
    StepCount(day: "20220720", steps: 10800),
    StepCount(day: "20220721", steps: 5300),
    StepCount(day: "20220722", steps: 10400),
    StepCount(day: "20220723", steps: 4000)
]

struct Charts2: View {
    
    
    var body: some View {
        Text("No Grey box")
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .foregroundStyle(.red)
            .font(.title2).bold()
        
        Chart(currentWeek) {
            BarMark(
                x: .value("Week Day", $0.weekday, unit: .day),
                y: .value("Step Count", $0.steps)
            )
        }
        .foregroundStyle(.red)
        .padding(.bottom, 5)
        
        HStack {
            Text("Additional data here:")
            Text(" 987654")
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
        .foregroundStyle(.gray)
        
        HStack {
            Text("Additional data here:")
            Text(" 123")
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 20)
        .foregroundStyle(.gray)
    }
}


#Preview {
    Charts2()
}
