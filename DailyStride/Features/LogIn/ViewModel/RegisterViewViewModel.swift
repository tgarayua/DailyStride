//
//  RegisterViewViewModel.swift
//  DailyStride
//
//  Created by Thomas Garayua on 10/19/24.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            print("Unable to validate Email and Password")
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            
            guard let userId = result?.user.uid else {
                print("Guard Trigger: Unable to authenticate user with result.")
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
    }
    
    private func insertUserRecord(id: String) {
        
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        
    }
    
    private func validate() -> Bool {
        
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("Guard Triggered: Empty space in name, email and/or password.")
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            print("Guard Trigger: Email doesn't contain '@' and/or '.' ")
            return false
        }
        
        guard password.count >= 6 else {
            print("Guard Trigger: Password is shorter than 6 characters.")
            return false
        }
        
        return true
    }
    
}
