import Foundation
import TipsCore
import Meow

final class Source: Model {
    var _id = ObjectId()
    var markdownURL: String
    var owner: Reference<Owner>
    var regex: String
}


// MARK: - Query
extension Source {
    static func find(_ source: Tricks.Source) -> Source? {
        guard let source = try? Source.findOne("markdownURL" == source.markdownURL) else {
            return nil
        }
        
        return source
    }
}
