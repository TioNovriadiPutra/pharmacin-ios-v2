//
//  UserDefaultsManager.swift
//  Pharmacin2.0
//
//  Created by Cyberindo Sinergi Sistem on 08/04/24.
//

import Foundation

class UserDefaultService{
    static let shared = UserDefaultService()
    
    private let tokenKey = "AuthToken"
    private let firebaseKey = "FirebaseToken"
    private let idKey = "roleId"
    
    func getToken() -> String?{
        return UserDefaults.standard.string(forKey: tokenKey) ?? ""
    }
    
    func saveToken(_ token:String){
        UserDefaults.standard.set(token, forKey: tokenKey)
    }
    
    func deleteToken() {
        UserDefaults.standard.removeObject(forKey: tokenKey)
    }
    
    func getId() -> Int?{
        UserDefaults.standard.integer(forKey: idKey)
    }
    
    func saveId(_ roleId: Int){
        UserDefaults.standard.set(roleId, forKey: idKey)
    }
    
    func deleteRoleId() {
        UserDefaults.standard.removeObject(forKey: idKey)
    }
    
    
    func getFirebaseToken() -> String?{
        return UserDefaults.standard.string(forKey: firebaseKey) ?? ""
    }
    
    func saveFirebaseToken(_ token:String){
        UserDefaults.standard.set(token, forKey: firebaseKey)
    }
    
    func deleteFirebaseToken() {
        UserDefaults.standard.removeObject(forKey: firebaseKey)
    }
}
