//
//  UserViewModal.swift
//  PostApp
//
//  Created by Vijay on 06/07/1944 Saka.
//

import Foundation
import SwiftUI


protocol UserDataDelegate {
    func userData(url:String,compltion:@escaping([User])-> Void)
}

class UserViewModal : ObservableObject,UserDataDelegate {
    private var network = NetworkManazer()
    @Published var data : [User] = []
    
//    init(userData : NetworkManazerDelegate) {
//        self.network = userData
//        getPostsData()
//    }
    
    func userData(url: String, compltion: @escaping ([User]) -> Void) {
   // private func getPostsData() {
       network.getApiData(url: url) { user in
           compltion(user)
            self.data = user
        }
    }
    
}
