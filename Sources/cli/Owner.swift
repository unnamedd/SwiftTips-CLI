import Foundation
import TipsCore
import Meow

final class Owner: Model {
    var _id = ObjectId()
    var name: String?
    var github: String?
    var twitter: String?
    
    init(){}
    
    init?(_ object: Tricks.Owner){
        
        let name = object.name.trimming()
        self.name = name != "" ? name : nil
        
        let github = object.github.trimming()
        self.github = github != "" ? github : nil
    
        
        let twitter = object.twitter.trimming()
        self.twitter = twitter != "" ? twitter : nil
    }
}

// MARK: - Custom String Convertible
extension Owner: CustomStringConvertible {
    public var description: String {
        var value = "Owner("
        value += "id: \"\(_id.hexString)\", "
        
        if let name = name {
            value += value.count > 0 ? ", " : ""
            value += "name: \"\(name)\""
        }
        
        if let github = github {
            value += value.count > 0 ? ", " : ""
            value += "name: \"\(github)\""
        }
        
        if let twitter = twitter {
            value += value.count > 0 ? ", " : ""
            value += "name: \"\(twitter)\""
        }
        
        value += ")"
        
        return value
    }
}

// MARK: - Query
extension Owner {
    static func find(by owner: Tricks.Owner) -> Owner? {
        guard owner.github != "", let owner = try? Owner.findOne("github" == owner.github) else {
            return nil
        }
        
        return owner
    }
}
