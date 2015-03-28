//
//  NumberAnimation.swift
//  numbersOfAnimation
//
//  Created by lifubing on 15/3/35.
//  Copyright (c) 3015年 lifubing. All rights reserved.
//

import UIKit
import Foundation

class NumberAnimation:NSObject{
   
    private var toTheValue = ""
    private var theData = 0
    private let dataLength = 0
    private var primaryValue = [Int]()
    private var label = UILabel()
    var left = 0
    private var index = 1
   
    
    init (label:UILabel,TotheValue:String) {
        super.init()
        
        self.toTheValue = TotheValue
        self.theData =  NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue
        self.label = label
        dataLength = countElements(TotheValue)
        
        index = (dataLength + 2) / 3 //进行分割
        
   //     primaryValue = [index]
        println(TotheValue)
        println("index: \(index)")
        println("dataLength \(dataLength)")
        
        left = dataLength
        
        var tiCallRate:NSTimeInterval = 0.1

        for var i = 0;i < index;i++ {
            
            if ((i == 0 || i == index - 1) && left < 3 ){
                
                switch left % 3 {
                case 0://最后为三位数
                    tiCallRate = 0.0006
                    self.primaryValue.append((NSNumberFormatter().numberFromString((TotheValue as NSString).substringWithRange(NSMakeRange(i*3, 3)))!.integerValue - 99))
                case 1://刚好最后只有一位数
                    tiCallRate = 0.2
                    self.primaryValue.append((NSNumberFormatter().numberFromString((TotheValue as NSString).substringWithRange(NSMakeRange(i*3, 1)))!.integerValue - 1))
                case 2://最后为两位数
                    tiCallRate = 0.08
                    self.primaryValue.append((NSNumberFormatter().numberFromString((TotheValue as NSString).substringWithRange(NSMakeRange(i*3, 2)))!.integerValue - 9))
                default:
                 println("left Default")
                    break
                }
            }else {
                self.primaryValue.append((NSNumberFormatter().numberFromString((TotheValue as NSString).substringWithRange(NSMakeRange(i*3, 3)))!.integerValue - 99))
                tiCallRate = 1.0 /  (Double)(100000)//其他的调用频率
            }
            
            var tUpdate = NSTimer()
            tUpdate = NSTimer.scheduledTimerWithTimeInterval(tiCallRate, target: self, selector:"numberTo:",userInfo: nil, repeats: true)
            left -= 3
        }
        println("left+3 :"+"\(left + 3)")
        var s = ""
        for var i = 0;i < primaryValue.count;i++ {
            s += "\(primaryValue[i])"
        }
    
        label.text = s
        println("primary \(primaryValue)")
        
//        for var i = 1;i <= index;i++ {
//            
//            if i == 1{
//                switch dataLength % 3 {
//                case 1 :
//                    tiCallRate = 0.1
//                case 2 :
//                    tiCallRate = 0.01
//                case 0 ://最后为三位
//                    tiCallRate = 0.001
//                default:
//                    break
//                }
//                
//            }else {
//                tiCallRate = 1.0 /  (Double)(100000)//其他的调用频率
//            }

//            var tUpdate = NSTimer()
//            tUpdate = NSTimer.scheduledTimerWithTimeInterval(tiCallRate, target: self, selector:"numberTo:",userInfo: nil, repeats: true)
     //   }
    }
    
    var theAddData = 0
    var stringData = ""
    var i = 0

    func numberTo(tUpdate:NSTimer){
        
            theAddData++
            switch index {
            case 1 :
                if ((theAddData + self.primaryValue[0])<(NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)) {
                    label.text = "\(theAddData + self.primaryValue[0])"
                }else {
                    label.text = "\(NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)"
                }
            case 2 :
                let da = (theAddData)*setpow(left + 3) + self.primaryValue[0]*setpow(left + 3) + self.primaryValue[1]
                if ( da < (NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)){
                    label.text = "\((theAddData)*(setpow(left+3) + 1) + self.primaryValue[0]*setpow(left + 3) + self.primaryValue[1])"
                }else{
                    label.text = "\(NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)"
                }
//            case 3 :
//                let da = theAddData * 1001001 + self.primaryValue[0] * 1000 + self.primaryValue[1] * 1000 + self.primaryValue[2]
//                if da < theData {
//                    label.text = "\(da)"
//                }else{
//                    label.text = "\(NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)"
//                }
            default:
                println("data too long")
                break
            }
        
    }
    func setpow (var len :Int)-> Int{
        var lenth = 1
        for (;len > 0; len--){
            lenth *= 10
        }
        //  println("the leftdata \(lenth)")
        return lenth
    }
    /*
    
    if index == 1{
    if theAddData+self.primaryValue[0] < NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue {
    theAddData++
    //   println(i)
    label.text = "\(self.primaryValue[0] + theAddData)"
    }
    }
    if index == 3{
    println(left)
    println(theAddData * setpow(left+3-1) + self.primaryValue[0] * setpow(left+3) + self.primaryValue[1])
    println(theAddData * setpow(left+3))
    println(self.primaryValue[0] * setpow(left+3))
    println(self.primaryValue[1])
    
    
    if (theAddData * setpow(left) + self.primaryValue[0] * setpow(left+3) < NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue) {
    theAddData++
    //   println("\(theAddData+self.primaryValue[0] * 100 + self.primaryValue[1])")
    label.text = "\(self.primaryValue[0] + theAddData%90)\( theAddData % setpow(left-3+1)+theAddData % 10)"//取余  是为了防止数字增长过快
    }else {
    label.text = "\(NSNumberFormatter().numberFromString(toTheValue as NSString)!.integerValue)"
    }
    
    }
    }
    */
}