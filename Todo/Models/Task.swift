//
//  Task.swift
//  Todo
//
//  Created by Maggie on 2019-03-04.
//  Copyright © 2019 MidTerm. All rights reserved.
//

import Foundation

class Task: NSObject, NSCoding, Codable {
    var title: String
    var desc: String
    
    public init(title: String, desc: String) {
        self.title = title
        self.desc = desc
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.desc, forKey: "desc")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = (aDecoder.decodeObject(forKey: "title") as? String)!
        self.desc = (aDecoder.decodeObject(forKey: "desc") as? String)!
    }
    
}

extension Task {
    public class func getMockData() -> [Task] {
        return [
            Task(title: "Eat", desc: "Eating"),
            Task(title: "Sleep", desc: "Sleeping"),
            Task(title: "Swim", desc: "Swimming"),
        ]
    }
}

