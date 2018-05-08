import Foundation
import TipsCore
import Meow

final class Comment: Model {
    // MARK: - Properties
    var _id = ObjectId()
    var text: String?
    
    // MARK: - Initializer
    init?(_ value: String?) {
        guard let value = value, value.trimming() != "" else {
            return nil
        }
        
        text = value
    }
    
    init?(_ object: Tricks.Comment){
        if let value = object.text, value.trimming() != "" {
            text = value
        }
    }
}

// MARK: - Custom String Converible
extension Comment: CustomStringConvertible {
    public var description: String {
        return text ?? "Comment(nil)"
    }
}
