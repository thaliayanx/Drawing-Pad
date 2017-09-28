//
//  ViewController.swift
//  Lab3
//
//  Created by thalia on 9/21/16.
//  Copyright © 2016 thalia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var color:UIColor=UIColor.blackColor()
    var array:[path]=[]
    var index:Int=0
    var brush: CGFloat = 1.0
    
    @IBOutlet weak var slider: UIBarButtonItem!
    @IBAction func sliderValue(sender: UISlider) {
        brush = CGFloat(sender.value)
    }
    @IBAction func clearButton(sender: AnyObject) {
        if array.count>=1 {
            array[array.count-1].removeFromSuperview()
            array.removeLast()
            index-=1
        }
        
    }
    @IBAction func clearAll(sender: AnyObject) {
        for v in view.subviews{
            if v.isKindOfClass(path){
                v.removeFromSuperview()
            }
        }
    }
    @IBOutlet weak var edit: UITextField!
    @IBOutlet weak var `switch`: UISwitch!
    @IBAction func switchChanged(sender: AnyObject) {
        if `switch`.on{
            view.backgroundColor=UIColor(red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 1)

        }
        else{
            view.backgroundColor=UIColor.whiteColor()
        }
        
    }
    @IBAction func purple(sender: AnyObject) {
        color=UIColor(red: 189/255, green: 121/255, blue: 230/255, alpha: 1)
    }
    @IBAction func pink(sender: AnyObject) {
        color=UIColor(red: 255/255, green: 0/255, blue: 255/255, alpha: 1)
    }
    @IBAction func blue(sender: AnyObject) {
        color=UIColor(red: 140/255, green: 163/255, blue: 255/255, alpha: 1)
    }
    @IBAction func green(sender: AnyObject) {
        color=UIColor(red: 143/255, green: 240/255, blue: 241/255, alpha: 1)
    }
    @IBAction func grey(sender: AnyObject) {
        color=UIColor(red: 119/255, green: 17/255, blue: 97/255, alpha: 1)
    }
    @IBAction func eraser(sender: AnyObject) {
        color=UIColor.whiteColor()
    }
    
    @IBOutlet weak var titleHere: UITextView!
    @IBAction func editTitle(sender: AnyObject) {
        titleHere.text=sender.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let myRect=CGRect(x:0,y:50,width: self.view.frame.width,height: self.view.frame.height-200)
        let myPath=path(frame: myRect)
        let touchPoint = (touches.first)!.locationInView(myPath) as CGPoint
        
        myPath.arr.append(touchPoint)
        self.array.append(myPath)
        myPath.backgroundColor=UIColor.clearColor()
        myPath.color=color
        myPath.stroke=brush
        self.view.addSubview(myPath)
        
        
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touchPoint=(touches.first)!.locationInView(array[index]) as CGPoint
        array[index].arr.append(touchPoint)
        array[index].setNeedsDisplay()
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touchPoint = (touches.first)!.locationInView(array[index]) as CGPoint
        array[index].arr.append(touchPoint)
        
        if array[index].arr[0]==array[index].arr[1]{
            array[index].arr.removeAll()
            array[index].arr.append(touchPoint)
            index+=1
    }
    else{
    array[index].backgroundColor=UIColor.clearColor()
    array[index].setNeedsDisplay()
    index+=1
    
    }
    
}

}

