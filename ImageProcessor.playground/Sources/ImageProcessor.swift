enum Colors {
    case Red
    case Green
    case Blue    
}

enum DefaultFilters : Filter {
    case IncreaseBrightness50Percent = Brightness(increasePercentage : 0.5) //"increase 50% brightness"
    case IncreaseContrastByTwo = Contrast(factor: 2.0) //"increase by 2 contrast"
    case GammaByTwo  = Gamma(gamma: 2.0) //"2x gamma"
    case MiddleThreshold = Threshold (127) //"middle threshold"
    case DuplicateRedIntensity = IncreaseIntesity(increasePercentage: 1, color: Colors.Red) //"duplicate intesity of red"
    case Invert = Invert() //"invert"
}

public class ImageProcessor {
    private var image : RGBAImage?
    
    public init (image : RGBAImage) {
        self.image = image;
    }
    
    public func applyFilter(filter: Filter) -> RGBAImage {
        self.image = filter.apply(self.image!)
        return self.image!
    }
    
    public func applyFilter(filters: Array<Filter>) -> RGBAImage {
        for index in 0...filters.count {
            self.image = self.applyFilter(filters[index])
        }
        return self.image!
    }
 
    public func applyDefaultFilter(name n : String) -> RGBAImage {
        var filter : Filter?
        switch n.lowercaseString.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet()) {
        case "increase 50% brightness":
            filter = .IncreaseBrightness50Percent.toRaw()
        case "increase contrast by 2":
            filter = .IncreseContrastByTwo.toRaw()
        case "apply 2 gamma":
            filter = .GammaByTwo.toRaw()
        case "apply middle threshold":
            filter = .MiddleThreshold.toRaw()
        case "duplicate intesity of red"
            filter = .DuplicateRedIntensity.toRaw()
        case "invert"
            filter = .Invert.toRaw()
        default:            
        }
        if (filter != nil) {
            self.applyFilter(filter);
        }
        
        return self.image!
    }   
}