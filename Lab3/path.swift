//
//  path.swift
//  Lab3
//
//  Created by thalia on 9/21/16.
//  Copyright © 2016 thalia. All rights reserved.
//

import UIKit
class path:UIView{
    var color: UIColor=UIColor.blackColor()
    var stroke: CGFloat=0.5
    var arr:[CGPoint]=[]{
        didSet{
            setNeedsDisplay()
        }
    }
 
    
private func findMidpoint(firstPoint: CGPoint, secondPoint: CGPoint) -> CGPoint {
    var mid=CGPointZero
    // implement this function here
    mid.x=(secondPoint.x+firstPoint.x)/2
    mid.y=(secondPoint.y+firstPoint.y)/2

    return mid
}

 func createQuadPath(arrayOfPoints: [CGPoint]) -> UIBezierPath {
    let newPath = UIBezierPath()
    let firstLocation = arrayOfPoints[0]
    newPath.moveToPoint(firstLocation)
    let secondLocation = arrayOfPoints[1]
    let firstMidpoint = findMidpoint(firstLocation, secondPoint: secondLocation)
    newPath.addLineToPoint(firstMidpoint)
    for index in 1 ..< arrayOfPoints.count-1 {
        let currentLocation = arrayOfPoints[index]
        let nextLocation = arrayOfPoints[index + 1]
        let midpoint = findMidpoint(currentLocation, secondPoint: nextLocation)
        newPath.addQuadCurveToPoint(midpoint, controlPoint: currentLocation)
    }
    let lastLocation = arrayOfPoints.last
    newPath.addLineToPoint(lastLocation!)
    return newPath
}

    override func drawRect(rect:CGRect){
    if arr.count>1{
        print("draw")
        UIColor.clearColor().setFill()
        let path=createQuadPath(arr)
        path.lineWidth=stroke
        color.setStroke()
        path.stroke()

    }
    else{
       print("else")
        let path=UIBezierPath()
        path.addArcWithCenter(arr[0], radius: stroke/2, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        
        color.setFill()
        path.fill()

        

    }
    }
}