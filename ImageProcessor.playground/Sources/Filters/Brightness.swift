public class Brightness : Filter {
    private var percentage : Double = 0;
    
    public init (percentage const: Double) {
        self.percentage = const;
    }
    
    public func apply(image: RGBAImage) -> RGBAImage {
        var pixel : Pixel?
        for r in 0...image.height - 1 {
            for c in 0...image.width - 1 {
                pixel = image.pixels[ image.height * r + c ]
                pixel!.red = pixel!.red * UInt8(1 + self.percentage)
                pixel!.green = pixel!.red * UInt8(1 + self.percentage)
                pixel!.blue = pixel!.red * UInt8(1 + self.percentage)
                image.pixels[image.height * r + c] = pixel!;
            }
        }
        return image
    }
    
}