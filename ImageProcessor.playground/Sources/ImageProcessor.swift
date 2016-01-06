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
    
}