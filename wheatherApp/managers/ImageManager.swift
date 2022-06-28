import Foundation
import UIKit

class ImageManager {
    static let shared = ImageManager()
        
        func loadFromUrl(urlWeather: URL) -> UIImage? {
            guard let data = try? Data(contentsOf: urlWeather) else { return nil }
            return UIImage(data: data)
        }
}
