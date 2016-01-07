public class Gamma : Filter {
    var gamma : Int
    
    public init (gamma value : Int) {
        self.gamma = gamma
    }
    
    func newValue(currentValue: Int) -> UInt8 {
        return UInt8(pow(currentValue / 255, self.gamma) * 255)
    }
    
    public func apply(image: RGBAImage) -> RGBAImage {
        var pixel : Pixel?
        for r in 0...image.height - 1 {
            for c in 0...image.width - 1 {
                pixel = image.pixels[ image.height * r + c ]
                pixel!.red = newValue(Int(pixel!.red))
                pixel!.green = newValue(Int(pixel!.green))
                pixel!.blue = newValue(Int(pixel!.blue))                
                image.pixels[image.height * r + c] = pixel!;
            }
        }
        return image
    }
}