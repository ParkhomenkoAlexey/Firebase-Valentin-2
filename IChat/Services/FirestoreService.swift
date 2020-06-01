//
//  FirestoreService.swift
//  IChat
//
//  Created by Алексей Пархоменко on 25.05.2020.
//  Copyright © 2020 Алексей Пархоменко. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    func saveProfileWith(email: String?,uid: String?, username: String?, avatarImage: UIImage?, description: String?, sex: String?, completion: @escaping (Result<MUser, Error>) -> Void) {
        
        guard Validators.isFilled(username: username, description: description, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }
        
        let muser = MUser(email: email!,
                          uid: uid!,
                          username: username!,
                          avatarStringUrl: "ferfpoerjfepfer",
                          description: description!,
                          sex: sex!)
    
        db.collection("users").document(uid!).setData(muser.representation) { (error) in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(muser))
            }
        }
    }
}
