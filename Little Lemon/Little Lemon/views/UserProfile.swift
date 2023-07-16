//
//  UserProfile.swift
//  Little Lemon
//
//  Created by luther on 2023/07/10.
//

import SwiftUI

struct UserProfile: View {
    @Environment(\.presentationMode) var presentation
    let firstName = UserDefaults.standard.string(forKey: kfirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: klastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kemail) ?? ""
    
    var body: some View {
        VStack {
            Text("Personal information")
            Image(systemName: "person.fill")
                .font(.title)
            Text(firstName)
            Text(lastName)
            Text(email)
            
            Button("Logout") {
                UserDefaults.standard.set(false, forKey: kisLogenIn)
                self.presentation.wrappedValue.dismiss()
            }
            Spacer()
        }
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
