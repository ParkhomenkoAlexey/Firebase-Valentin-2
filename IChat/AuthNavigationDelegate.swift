//
//  AuthNavigationDelegate.swift
//  IChat
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation

protocol AuthNavigationDelegate: class {
    func toLoginVC()
    func toSignUpVC()
}
