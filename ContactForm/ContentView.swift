//
//  ContentView.swift
//  ContactForm
//
//  Created by Otavio Lourenço on 26/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var emailAddress = ""
    @State private var phoneNumber = ""
    @State private var message = "Write your message here..."
    @State private var subject = "Help"
    @State private var includeLogs = false
    
    @State private var preferredContactMethod = ContactMethod.email
    
    enum ContactMethod {
        case email, phone
      }
    
    var body: some View {
        VStack {
            NavigationStack{
                Form{
                    Section(header: Text("How can we reach you?")){
                        Picker("Contact method", selection: $preferredContactMethod){
                            Text("E-mail").tag(ContactMethod.email)
                            Text("Phone").tag(ContactMethod.phone)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        switch preferredContactMethod {
                        case .email:
                            TextField("E-mail Address", text: $emailAddress)
                        case .phone:
                            TextField("Phone", text: $phoneNumber)
                        }
                    }
                    
                    Section(header: Text("What can we help you with?")){
                        Picker("Subject", selection: $subject) {
                            ForEach(["Help", "Suggestion", "Bug Report"], id: \.self) { subject in
                                Text(subject)
                            }
                        }
                    }
                    
                    Section(header: Text("Briefly explain what's going on.")){
                        TextEditor(text: $message)
                    }
                   
                    Section(header: Text("This information will be sent anonymously.")){
                        Toggle("Include Logs", isOn: $includeLogs)
                    }
                    
                    Button("Submit", action: {
                        print("Submit button tapped")
                    })
                }
                .navigationTitle("Contact us")
            }
        }
    }
}

#Preview {
    ContentView()
}
