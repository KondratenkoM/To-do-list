//
//  CasesView.swift
//  To do list
//
//  Created by apple on 22.04.2022.
//

import SwiftUI

struct CasesView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cases: Cases
    
    @State var name = ""
    @State var type = "Important"
    @State var description = ""
    @State var time =  Date()
    @State var date = Date()
    //array for picker
    let types = ["Important","Unimportant","Daily"]
    
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Name", text: $name)
                    .background(Color.sixtyFiveWhite)
                Picker("Type", selection: $type){
                    ForEach((self.types), id: \.self){
                        Text($0)
                            .background(Color.sixtyFiveWhite)
                    }
                }
                TextField("Description", text: $description)
                //MARK: - Pick date and time
                Section(header: Text("date and time").foregroundColor(.sixtyFiveWhite)){
                    
                    DatePicker(selection: $time, in: Date()..., displayedComponents: .date) {
                        Text("Select a date")
                            .foregroundColor(Color("RowColor"))
                    }
                    DatePicker(selection: $time, in: Date()..., displayedComponents: .hourAndMinute) {
                        Text("Select a time")
                            .foregroundColor(Color("RowColor"))
                    }
                }
                HStack {
                    Spacer()
                    Button(action: {
                        let item = AddCase(
                            name: self.name,
                            type: self.type,
                            description: self.description,
                            time: self.time,
                            date: self.date)
                        
                        self.cases.cases.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                        
                    }, label: {
                        Text("Add")
                            .foregroundColor(Color("RowColor"))
                            
                    }).background(Color.sixtyFiveWhite)
                    Spacer()
                }
            }
            //MARK: - hide keyboard
            .gesture(DragGesture().onChanged{_ in UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)})
            
            .navigationTitle(Text("Add new event"))
        }
    }
}

struct CasesView_Previews: PreviewProvider {
    static var previews: some View {
        CasesView(cases: Cases())
    }
}
