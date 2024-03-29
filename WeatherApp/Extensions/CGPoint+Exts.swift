//
//  CGPoint+Exts.swift
//  WeatherApp
//
//  Created by ty foskey on 9/30/20.
//  Copyright © 2020 ty foskey. All rights reserved.
//

import SwiftUI

extension CGPoint {
    static func midPointForPoints(p1:CGPoint, p2:CGPoint) -> CGPoint {
          return CGPoint(x:(p1.x + p2.x) / 2,y: (p1.y + p2.y) / 2)
      }
    
    static func controlPointForPoints(p1:CGPoint, p2:CGPoint) -> CGPoint {
         var controlPoint = CGPoint.midPointForPoints(p1:p1, p2:p2)
         let diffY = abs(p2.y - controlPoint.y)
         
         if (p1.y < p2.y){
             controlPoint.y += diffY
         } else if (p1.y > p2.y) {
             controlPoint.y -= diffY
         }
         return controlPoint
     }
    
    static func controlPointForPointsOpps(p1:CGPoint, p2:CGPoint) -> CGPoint {
        var controlPoint = CGPoint.midPointForPoints(p1:p1, p2:p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if (p1.y > p2.y){
            controlPoint.y += diffY
        } else if (p1.y < p2.y) {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
}
