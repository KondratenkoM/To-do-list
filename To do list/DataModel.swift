//
//  DataModel.swift
//  To do list
//
//  Created by apple on 22.04.2022.
//

import SwiftUI

struct AddCase: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var description: String
    var time: Date
    var date: Date
    
}

class Cases: ObservableObject {
    @Published var cases = [AddCase](){
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(cases) {
                UserDefaults.standard.set(encoded, forKey: "Cases")
            }
        }
    }
        init(){
            if let items = UserDefaults.standard.data(forKey: "Cases") {
                let decoder = JSONDecoder()
                if let decoded = try? decoder.decode([AddCase].self, from: items) {
                    self.cases = decoded
                    return
                
            }
        }
    }
    
    
}
