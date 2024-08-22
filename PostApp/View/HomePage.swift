//
//  HomePage.swift
//  PostApp
//
//  Created by Vijay on 06/07/1944 Saka.
//

import SwiftUI

struct HomePage: View {
    var url = "http://jsonplaceholder.typicode.com/posts"
    let userModal = UserViewModal()
    @State  var datamodal = [User]()
   // @StateObject private var vm : UserViewModal
    
//    init(dataServices:NetworkManazerDelegate) {
//        _vm = StateObject(wrappedValue: UserViewModal(userData: dataServices))
//    }
    
    var body: some View {
        NavigationView() {
//            List( {
//               // ForEach(0..<10) { index  in
//                ForEach(datamodal.indices, id: \.self) { index in
//                    NavigationLink {
//
//                    } label: {
//
//                    }
//
//                    VStack(alignment: .leading,spacing: 10) {
//                        HStack(alignment:.top,spacing:10) {
//                            Text("\(datamodal[index].id ?? 0)")
//                                .foregroundColor(.black)
//                                .font(.headline)
//                            Text(".")
//                            Text(datamodal[index].title ?? "")
//                            // .foregroundColor(.green)
//                                .font(.headline)
//                        }
//                        Text(datamodal[index].body ?? "")
//                        // .foregroundColor(.orange)
//                            .font(.caption)
//                    }
//                    .foregroundColor(index % 2 == 0 ? .orange : .green)
//                }
//            }
//
//
            
            List(datamodal,id: \.self) { data in
                
                NavigationLink(destination: ShowUser(user: data)) {
                    ExtractedView(datamodal: data)
                }
            }
            .onAppear(){
                userModal.userData(url: url) { userData in
                    self.datamodal = userData
                }
            }
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.large)
            
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
      HomePage()
    }
}

struct ExtractedView: View {
    var datamodal : User
    var body: some View {
        VStack(alignment: .leading,spacing: 10) {
            HStack(alignment:.top,spacing:10) {
                Text("\(datamodal.id ?? 0)")
                    .foregroundColor(.black)
                    .font(.headline)
                Text(".")
                Text(datamodal.title ?? "")
                
                // .foregroundColor(.green)
                    .font(.headline)
            }
            Text(datamodal.body ?? "")
            // .foregroundColor(.orange)
                .font(.caption)
        }
        .foregroundColor((datamodal.id ?? 0) % 2 == 0 ? .orange : .green)
    }
}
