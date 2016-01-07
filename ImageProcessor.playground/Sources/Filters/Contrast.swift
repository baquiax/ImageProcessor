public class Contrast : Filter {
    private var factor : Double = 0;
    
    public init (factor const: Double) {
        self.factor = const;
    }
    
    func limitAndCastNumber(number:Double) -> UInt8 {
        return UInt8(max(0,min(number, 255)))
    }
    
    public func apply(image: RGBAImage) -> RGBAImage {
        var pixel : Pixel?
        for r in 0...image.height - 1 {
            for c in 0...image.width - 1 {
                pixel = image.pixels[ image.height * r + c ]
                pixel!.red = limitAndCastNumber((Double(pixel!.red) - 0.5) * self.factor + 0.5)
                pixel!.green = limitAndCastNumber((Double(pixel!.green) - 0.5) * self.factor + 0.5)
                pixel!.blue = limitAndCastNumber((Double(pixel!.blue) - 0.5) * self.factor + 0.5)
                image.pixels[image.height * r + c] = pixel!;
            }
        }
        return image
    }
    
}