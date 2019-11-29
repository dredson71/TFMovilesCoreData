//
//  CoreView.swift
//  TF
//
//  Created by Cheryl Mori Gonzales on 11/28/19.
//  Copyright © 2019 DiegoNarreaM. All rights reserved.
//

import SwiftUI

struct CoreView: View {
    
    @Environment(\.managedObjectContext)var managedObjectContext
    @FetchRequest(fetchRequest:ToDoItem.getAllToDoItems()) var toDoItems:FetchedResults<ToDoItem>
    
    @State private var newTodoItem = ""
    var body:some View{
        NavigationView{
            List{
                Section(header:Text("What's next")){
                    HStack{
                        TextField("New Item", text: self.$newTodoItem)
                        Button(action:{
                            let toDoItem = ToDoItem(context: self.managedObjectContext)
                            toDoItem.title=self.newTodoItem
                            toDoItem.createdAt=Date()
                            
                            do{
                                try self.managedObjectContext.save()
                            }catch{
                                print(error)
                            }
                            self.newTodoItem = ""
                        }){
                            Image(systemName: "plus.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                        }
                    }
                }.font(.headline)
                Section(header: Text("To Do's")){
                    ForEach(self.toDoItems){todoItem in
                        ToDoItemView(title:todoItem.title! ,createdAt:"\(todoItem.createdAt!)")
                    }
                }
            }
        .navigationBarTitle(Text("MyList"))
        .navigationBarItems(trailing: EditButton())
        }
    }
    
    
}

struct CoreView_Previews: PreviewProvider {
    static var previews: some View {
        CoreView()
    }
}
