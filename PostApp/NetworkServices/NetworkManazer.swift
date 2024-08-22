//
//  NetworkManazer.swift
//  PostApp
//
//  Created by Vijay on 06/07/1944 Saka.
//

import Foundation

//protocol NetworkManazerDelegate {
//    func getApiData(url:String,completionHandler:@escaping([User])->Void)
//}

class NetworkManazer {
    func getApiData(url:String,completionHandler:@escaping([User])->Void) {
        if let url = URL(string: url ) {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if data != nil, error == nil {
                    do{
                        let jasonData = try JSONDecoder().decode([User].self, from: data!)
                        completionHandler(jasonData)
                    }catch {
                        print(error.localizedDescription)
                    }
                }else{
                    print(error?.localizedDescription ?? "")
                }
            }.resume()
        }
        
    }
}
