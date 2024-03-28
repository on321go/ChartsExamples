//
//  ChartsDataFile.swift
//  ChartsExamples
//
//  Created by jrubin on 3/25/24.
//

import Foundation

//Global for speed only
struct ChartData: Identifiable, Equatable {
    let type: String
    let count: Double
    
    var id: String { return type }
}

let rpmData = [
    ChartData(type: "Ride 1", count: 2595),
    ChartData(type: "RIde 2", count: 4507),
    ChartData(type: "Ride 3", count: 3955),
    ChartData(type: "Ride 4", count: 4995),
]

let hpData = [
    ChartData(type: "Ride 1", count: 95),
    ChartData(type: "RIde 2", count: 207),
    ChartData(type: "Ride 3", count: 165),
    ChartData(type: "Ride 4", count: 185),
]

let mphData = [
    ChartData(type: "1/3/24", count: 95),
    ChartData(type: "1/5/24", count: 107),
    ChartData(type: "1/6/24", count: 65),
    ChartData(type: "1/7/24", count: 85),
]

let collection1: [ChartData] = [
    ChartData(type: "Ride 1", count: 10),
    ChartData(type: "Ride 2", count: 125),
    ChartData(type: "Ride 3", count: 12),
    ChartData(type: "Ride 4", count: 40),
    ChartData(type: "Ride 5", count: 90)
]

let collection2: [ChartData] = [
    ChartData(type: "Ride 1", count: 73),
    ChartData(type: "Ride 2", count: 34),
    ChartData(type: "Ride 3", count: 66),
    ChartData(type: "Ride 4", count: 180),
    ChartData(type: "Ride 5", count: 10),
]

struct HeatData: Identifiable {
    let locationX: Int
    let locationY: Int
    let temperatur: Double
    let id = UUID()

    static var exampleData: [HeatData] {
        [HeatData(locationX: 50, locationY: 50, temperatur: 23.0),
         HeatData(locationX: 50, locationY: 100, temperatur: 15.0),
         HeatData(locationX: 50, locationY: 150, temperatur: 25.0),
         HeatData(locationX: 50, locationY: 200, temperatur: 22.5),

         HeatData(locationX: 100, locationY: 50, temperatur: 20.0),
         HeatData(locationX: 100, locationY: 100, temperatur: 26.5),
         HeatData(locationX: 100, locationY: 150, temperatur: 29.4),
         HeatData(locationX: 100, locationY: 200, temperatur: 17.0),

         HeatData(locationX: 150, locationY: 50, temperatur: 24.0),
         HeatData(locationX: 150, locationY: 100, temperatur: 23.5),
         HeatData(locationX: 150, locationY: 150, temperatur: 21.5),
         HeatData(locationX: 150, locationY: 200, temperatur: 15.0),

         HeatData(locationX: 200, locationY: 50, temperatur: 10.0),
         HeatData(locationX: 200, locationY: 100, temperatur: 26.5),
         HeatData(locationX: 200, locationY: 150, temperatur: 27.0),
         HeatData(locationX: 200, locationY: 200, temperatur: 17.0)
        ]
    }
}
