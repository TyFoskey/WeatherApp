//
//  Line.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

struct Line: View {
    var data: [Double]
    var bottomTitles: [String]
    @Binding var frame: CGRect
    var height: CGFloat = 100
    let padding: CGFloat = 30
    var addedText: String {
        return data.count == 6 ? "%" : "°"
    }
    var stepWidth: CGFloat {
        let addedHeight: CGFloat = (data.count > 6) ? 40 : -8
        return frame.size.width / CGFloat(data.count-1) + addedHeight
    }
    
    var stepHeight: CGFloat {
        let min = data.min()
        let max = data.max()
        
        if let min = min, let max = max, min != max {
            if (min >= 0) {
               // let new = (height-padding) / CGFloat(max - min)
                return (height-padding) / CGFloat(max - min)
            } else {
              //  let new = (height-padding) / CGFloat(max - min)
                return (height-padding) / CGFloat(max - min)
            }
        }
        return 0
    }
    
    var scrollWidth: CGFloat {
        return (data.count > 6) ? 1360 : frame.size.width
    }
    
    var points: [CGPoint] {
        let (_, cgPoints) = Path.quadCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight))
        return cgPoints
    }
    
    var path: Path {
        let (path, _) = Path.quadCurvedPathWithPoints(points: data, step: CGPoint(x: stepWidth, y: stepHeight))
        return path
    }
    
    var body: some View {
        VStack {
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    ZStack {
                        self.path
                            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .butt, lineJoin: .miter, miterLimit: 12, dash: [3], dashPhase: 6))
                            .foregroundColor(Color(UIColor.white.withAlphaComponent(0.25)))
                            .frame(width: scrollWidth, height: 100)
                            .padding(.leading, 30)
                        
                        ForEach(0..<points.count) {
                            Text("\(Int(self.data[$0]) * -1)" + self.addedText)
                                .font(.system(size: 16))
                                .foregroundColor(Color.white)
                                .position(x: self.points[$0].x + 28, y: self.points[$0].y + 12)
                            
                            IndicatorPoint()
                                .position(x: self.points[$0].x + 28, y: self.points[$0].y + 30)
                               // .frame(width: 10, height: 10)
                            
                            PathLineView(x: self.points[$0].x + 28, y: self.points[$0].y + 30)
                            
                            Text(self.bottomTitles[$0])
                                .foregroundColor(Color.white)
                                .position(x: self.points[$0].x + 28, y: 150)
                        }
                    }
                }.frame(maxWidth: .infinity)
            }
        }
    }
}

struct PathLineView: View {
    let x: CGFloat
    let y: CGFloat
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: x, y: y))
            path.addLine(to: CGPoint(x: x, y: 130))
        }
        .stroke(style: StrokeStyle(lineWidth: 1))
        .foregroundColor(Color(UIColor.white.withAlphaComponent(0.15)))
        
    }
}
