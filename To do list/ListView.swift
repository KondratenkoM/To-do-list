//
//  ListView.swift
//  To do list
//
//  Created by apple on 22.04.2022.
//

import SwiftUI

struct ListVIew: View {
    
    
    @State private var showingAddEvent = false
    @ObservedObject var cases = Cases()
    
    let types = ["Important","Unimportant","Daily"]
    
    //MARK: - Date/time formatter
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()
    let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    
    var body: some View {

            List{
                ForEach(cases.cases) { item in
                    HStack{
                        VStack{
                            Text(item.name)
                                .font(.system(size: 15, weight: .semibold, design: .default))
                                .foregroundColor(.eightySevenWhite)
                            Text(item.type)
                                .font(.system(size: 12, weight: .light, design: .default))
                                .foregroundColor(.sixtyFiveWhite)
                                
                        }
                        Spacer()
                        Text(item.description)
                            .font(.system(size: 12, weight: .light, design: .default))
                            .foregroundColor(.sixtyFiveWhite)
                        Spacer()
                        VStack{
                            Text(item.time, formatter: timeFormatter)
                                .foregroundColor(.sixtyFiveWhite)
                            Text(item.date, formatter: dateFormatter)
                                .foregroundColor(.thirtyWhite)
                                .font(.callout)
                        }
                    }
                }.onDelete(perform: delete)
                    .listRowBackground(Color("RowColor"))
            }
    }
    
    
    //MARK: - Delete cell
    func delete(at offSets: IndexSet){
        cases.cases.remove(atOffsets: offSets)
    }
        
   
}

struct ListVIew_Previews: PreviewProvider {
    static var previews: some View {
        ListVIew()
    }
}
