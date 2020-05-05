//
//  ContentView.swift
//  List SwiftUI
//
//  Created by Giuseppe Sapienza on 09/10/2019.
//  Copyright © 2019 Giuseppe Sapienza. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var books: [Book] = [
        Book(title: "Clean Code",
             link: "https://amzn.to/2YqSuEu",
             image: #imageLiteral(resourceName: "cleancode")),
        
        Book(title: "A Philosophy of Software Design",
             link: "https://amzn.to/2xxhkaw",
             image: #imageLiteral(resourceName: "philosophy")),
        
        Book(title: "Design Patterns",
             link: "https://amzn.to/2YkHCZ2",
             image: #imageLiteral(resourceName: "pattern"))
    ]
    
    @State var searchIsPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                List(
                    books,
                    id: \.title,
                    rowContent: { book in
                        
                        NavigationLink(destination: Text(book.title), label: {
                            Image(uiImage: book.image)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 120, height: 160)
                                .cornerRadius(8)
                                .shadow(radius: 20)
                                .padding([.top, .bottom])
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .fontWeight(.bold)
                                Text(book.link)
                                    .font(.callout)
                            }
                        })
                        
                })
                .navigationBarTitle("Programming Books")
                .navigationBarItems(trailing: Button(action: {
                    self.searchIsPresented.toggle()
                }, label: { Text("Search") }))
            }
        }
        .sheet(isPresented: $searchIsPresented, content: {
            VStack {
                Text("Search View")
                
                Spacer()
                
                Button(action: {
                    self.searchIsPresented.toggle()
                }, label: {
                    Text("Close")
                })
            }.padding()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
