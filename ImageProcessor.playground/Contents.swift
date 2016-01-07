//Alexander Baquiax (alexbqb@galileo.edu)

import UIKit
let image = UIImage(named: "sample")
if (image != nil) {
    /*
    * You can use the next defult filters:
    * - "increase 50% of brightness"
    * - "increase contrast by 2"
    * - "gamma 1.5"
    * - "middle threshold"
    * - "duplicate intesity of red"
    * - "invert"
    */
    
    //Applying default filter by String name
    var rgbaImage = RGBAImage(image: image!);
    var ip = ImageProcessor(image: rgbaImage!);    
    let resultImage = ip.applyDefaultFilter(name: "increase contrast by 2").toUIImage();

    
    //Applying multiple filters
    var rgbaImage2 = RGBAImage(image: image!);
    var ip2 = ImageProcessor(image: rgbaImage2!);
    let filters : [Filter] = [Contrast(factor: 2), IncreaseIntensity(increaseFactor: 2, color: Colors.Green), IncreaseIntensity(increaseFactor: 2, color: Colors.Red)];
    let resultImage2 = ip2.applyFilters(filters: filters).toUIImage()

}

