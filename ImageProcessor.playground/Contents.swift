//: Playground - noun: a place where people can play

import UIKit
let image = UIImage(named: "sample")
if (image != nil) {
    /*
    * You can use the next defult filters:
    * - "increase 50% brightness"     
    * - "increase contrast by 2"
    * - "apply 2 gamma"
    * - "apply middle threshold"
    * - "duplicate intesity of red"
    * - "invert"
    */
    var rgbaImage = RGBAImage(image: image!);
    var ip = ImageProcessor(image: rgbaImage!);    
    let resultImage = ip.applyDefaultFilter("invert").toUIImage();
    
}

