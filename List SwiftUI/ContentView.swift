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
         Book.init(title: "Clean Code",
                         link: "https://amzn.to/2YqSuEu",
                         image: #imageLiteral(resourceName: "cleancode")),
               Book.init(title: "Elegant Objects",
                         link: "https://amzn.to/32N4dg0",
                         image: #imageLiteral(resourceName: "elegant")),
               Book.init(title: "Design Patterns",
                         link: "https://amzn.to/2YkHCZ2",
                         image: #imageLiteral(resourceName: "pattern")),
    ]
    
    var contacts: [String] = ["Giuseppe", "Luca", "Matteo", "Edoardo", "Seby", "Gabriele", "Dario"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Programming Books")
                .font(.largeTitle)
                .padding()
            
            List(
                books,
                id: \.title,
                rowContent: { book in
                    
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
                }
            )
            
            /*
            List(
                contacts,
                id: \.hash,
                rowContent:
            { contact in
                Text(contact)
            }) */
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
