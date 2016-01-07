//: Playground - noun: a place where people can play

import UIKit

var a = 1


let image = UIImage(named: "sample")
// Process the image!

if (image != nil) {
    var rgbaImage = RGBAImage(image: image!);
    var ip = ImageProcessor(image: rgbaImage!);
    var b : Brightness = Brightness(percentage: 0);
    let newImage : RGBAImage = ip.applyFilter(b)
    newImage.toUIImage()
    
    var rgbaImage2 = RGBAImage(image: image!);
    var ip2 = ImageProcessor(image: rgbaImage2!);
    var c : Contrast = Contrast(factor: 1.5);
    let newImage2 : RGBAImage = ip2.applyFilter(c)
    newImage2.toUIImage()
}

