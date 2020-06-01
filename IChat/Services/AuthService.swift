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
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void)  {
        
        guard Validators.isFilled(email: email, password: password, confirmPassword: confirmPassword) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard password! == confirmPassword! else {
            completion(.failure(AuthError.passwordNotMatched))
            return
        }
        
        guard Validators.isSimpleEmail(email!) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
    
        Auth.auth().createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let email = email, let password = password, email != "", password != "" else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
//            result?.user.email // -> в память устройства
            completion(.success(result.user))
        }
    }
}
