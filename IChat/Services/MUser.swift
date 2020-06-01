//
//  MUser.swift
//  IChat
//
//  Created by Алексей Пархоменко on 28.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation

struct MUser {
    var email: String
    var uid: String
    var username: String
    var avatarStringUrl: String
    var description: String
    var sex: String
    
    var representation: [String: Any] {
        var rep = ["email": email]
        rep["uid"] = uid
        rep["fullname"] = username
        rep["avatarUrl"] = avatarStringUrl
        rep["description"] = description
        rep["sex"] = sex
        return rep
    }
}
