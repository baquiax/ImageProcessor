public class Contrast : Filter {
    private var factor : Double = 0;
    
    public init (factor const: Double) {
        self.factor = pow((100 + const) / 100, 2);        
    }
    
    func limitAndCastNumber(number:Double) -> UInt8 {
        return UInt8(max(0,min(number, 255)))
    }
    
    func calculateContrast (value: Double) -> UInt8 {
        return limitAndCastNumber(((((value / 255) - 0.5) * self.factor) + 0.5) * 255)
    }
    
    public func apply(image: RGBAImage) -> RGBAImage {
        var pixel : Pixel?
        for r in 0...image.height - 1 {
            for c in 0...image.width - 1 {
                pixel = image.pixels[ image.height * r + c ]
                pixel!.red = calculateContrast(Double(pixel!.red))
                pixel!.green = calculateContrast(Double(pixel!.green))
                pixel!.blue = calculateContrast(Double(pixel!.blue))                
                image.pixels[image.height * r + c] = pixel!;
            }
        }
        return image
    }
    
}