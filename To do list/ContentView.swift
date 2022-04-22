//
//  ContentView.swift
//  To do list
//
//  Created by apple on 22.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddEvent = false
    @ObservedObject var cases = Cases()
    
    //MARK: - Customizing bar,background
    init() {
        let attrs: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(Color.eightySevenWhite),
            .font: UIFont.monospacedSystemFont(ofSize: 36, weight: .black)
        ]
            UITableView.appearance().backgroundColor = UIColor(Color("BackgroundColor"))
            UINavigationBar.appearance().largeTitleTextAttributes = attrs
        }
    
    
    var body: some View {
        
        NavigationView{
            
            ListVIew()
                .navigationTitle(Text("To Do List"))
            
            //MARK: - Plus button item
            .toolbar(content: {
                ToolbarItem(placement: .automatic, content: {
                    Button(action: {
                        self.showingAddEvent.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(Color.eightySevenWhite)
                        
                    }).padding()
                    .sheet(isPresented: $showingAddEvent, content: {
                        CasesView(cases: self.cases)
                    })
                })
            })
        }
        
    }

}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
