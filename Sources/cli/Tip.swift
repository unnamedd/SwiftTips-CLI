import TipsCore
import Meow

final class Tip: Model {
    // MARK: - Properties
    var _id = ObjectId()
    var issue: Int?
    var title: String?
    var tweet: String?
    var description: String?
    var code: String?
    var comments: [Reference<Comment>]?
    
    // MARK: - Initializer
    init?(_ object: Tricks.Tip){
        if let value = object.issue {
            issue = value
        }
        
        if let value = object.title, value.trimming() != "" {
            title = value
        }
        
        if let value = object.tweet, value.trimming() != "" {
            tweet = value
        }
        
        if let value = object.description, value.trimming() != "" {
            description = value
        }
        
        if let value = object.code, value.trimming() != "" {
            code = value
        }
        
        if let value = object.comments, value.count > 0 {
            var comments = [Reference<Comment>]()
            value.forEach { item in
                if let comment = Comment(item) {
                    try? comment.save()
                    comments.append(Reference(to: comment))
                }
            }
            
            self.comments = comments
        }
    }
}

// MARK: - Query
extension Tip {
    static func find(_ tip: Tricks.Tip) -> Tip? {
        guard let issue = tip.issue, let tip = try? Tip.findOne("issue" == issue) else {
            return nil
        }
        
        return tip
    }
}
