//
//  Path.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

extension Path {
    static func quadCurvedPathWithPoints(points:[Double], step:CGPoint, globalOffset: Double? = nil) -> (Path, [CGPoint]) {
        var path = Path()
        var cgPoints = [CGPoint]()
        var lastPointY: CGFloat!
        let offset = globalOffset ?? points.min()!
        //        guard let offset = points.min() else { return path }
        var p1 = CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y)
        lastPointY = p1.y
       // print(p1, "the p1")

        path.move(to: p1)
        cgPoints.append(CGPoint(x: 0, y: CGFloat(points[0]-offset)*step.y))
        for pointIndex in 1..<points.count {
            let newStep: CGFloat = lastPointY > CGFloat(points[pointIndex]-offset) ? step.y : step.y
            let p2 = CGPoint(x: step.x * CGFloat(pointIndex), y: newStep*CGFloat(points[pointIndex]-offset))
            let midPoint = CGPoint.midPointForPoints(p1: p1, p2: p2)
            path.addQuadCurve(to: p2, control: midPoint)

           
            p1 = p2
            
            let newPoint = p2
            cgPoints.append(newPoint)
            lastPointY = p2.y
        }
        return (path, cgPoints)
    }
}
