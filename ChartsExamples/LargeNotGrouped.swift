//
//  LargeNotGrouped.swift
//  ChartsExamples
//
//  Created by jrubin on 3/25/24.
//

import SwiftUI

struct LargeNotGrouped: View {
    var body: some View {
    
            
            ScrollView {
                
                
                BarChartVerticle()
                    .aspectRatio(contentMode: .fill)
                
                Divider()
                    .background(Color(.white))
                    .padding(.bottom, 25)
                
                
                BarChartHorizontal()
                    .aspectRatio(contentMode: .fill)
                
                Divider()
                    .background(Color(.white))
                    .padding(.bottom, 25)
                
                AreaChart()
                    .aspectRatio(contentMode: .fill)
                
            }
            
            .padding()
        
    }
}

#Preview {
    LargeNotGrouped()
}
