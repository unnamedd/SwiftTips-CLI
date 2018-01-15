import Foundation
import TipsCore
import Meow

final class Comment: Model {
    var _id = ObjectId()
    var text: String?
    
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

extension Comment: CustomStringConvertible {
    public var description: String {
        return text ?? "Comment(nil)"
    }
}
