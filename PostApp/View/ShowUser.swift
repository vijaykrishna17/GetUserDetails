//
//  ShowUser.swift
//  PostApp
//
//  Created by Vijay on 06/07/1944 Saka.
//

import SwiftUI

struct ShowUser: View {
    var user : User
    var body: some View {
        VStack(alignment:.leading,spacing: 20){
            HStack {
                Text("\(user.userId ?? 0)")
                    .foregroundColor(.black)
                Text(".")
                Text(user.title ?? "")
                    .foregroundColor(.black)
                    .font(.headline)
            }
            Text(user.body ?? "")
                .foregroundColor(.black)
            Spacer()
        }.padding()
    }
}

struct ShowUser_Previews: PreviewProvider {
    static var previews: some View {
        ShowUser(user: User.init(userId: 1, id: 1, title: "j", body: "jj"))
    }
}
