//
//  ContentView.swift
//  TF
//
//  Created by Cheryl Mori Gonzales on 11/28/19.
//  Copyright © 2019 DiegoNarreaM. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
        var body: some View {
            NavigationView{
                NavigationLink(destination:CoreView()){
                    Text("Go Core")
                        
                        
                }.background(Color.red)
            }
            }
        }
    
