//
//  AuthService.swift
//  IChat
//
//  Created by Алексей Пархоменко on 21.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import UIKit
import FirebaseAuth

enum MyResult {
    case success
    case failure(Error)
}

class AuthService {
    
    static let shared = AuthService()
    
    let someProperty: String = "someProperty"
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (MyResult) -> Void)  {
        
        Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
            guard result != nil else {
                completion(.failure(error!))
                return
            }
            completion(.success)
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (MyResult) -> Void) {
        Auth.auth().signIn(withEmail: email!, password: password!) { (result, error) in
            guard result != nil else {
                completion(.failure(error!))
                return
            }
            completion(.success)
        }
    }
}
