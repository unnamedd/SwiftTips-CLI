import Foundation
import TipsCore
import Meow

try Meow.init("mongodb://tips:password@localhost:27017/tips")

do {
    print("Removing collections Tip, Comment")
    try Tip.collection.remove()
    try Comment.collection.remove()
}
catch let error {
    print("Error: \(error.localizedDescription)")
}

let content = Tricks(from: .remote)
content.read { tips in
    tips.forEach { item in
        do {
            guard Tip.find(item) == nil else {
                return
            }
        
            if let tip = Tip(item) {
                try tip.save()
            }
        }
        catch let error {
            print("Error: \(error)")
        }
    }
}

let tips = try Tip.find()
tips.forEach { tip in
    guard
        let issue = tip.issue,
        let title = tip.title else {
        return
    }
    
    print("\(tip._id.hexString) - [#\(issue)] \(title)")
    if let list = tip.comments, let comments = try? list.resolveUnordered() {
        comments.forEach { comment in
            print("     - \(comment)")
        }
    }
}

