//
//  ContentView.swift
//  CustomCoolAnimation
//
//  Created by ramil on 21.10.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var size1: CGFloat = 0
    @State var size2: CGFloat = 0
    @State var size3: CGFloat = 0
    var body: some View {
        
        GeometryReader { reader in
            ZStack {
                VStack {
                    HStack {
                        Circle().fill(Color.red).frame(width: 80, height: 80).offset(y: self.size1)
                        Circle().fill(Color.orange).frame(width: 80, height: 80).offset(y: self.size2)
                        Circle().fill(Color.blue).frame(width: 80, height: 80).offset(y: self.size3)
                    }
                    Spacer()
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            self.size1 = reader.size.height - 50
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                self.size2 = reader.size.height - 50
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                                self.size3 = reader.size.height - 50
                            }
                        }) {
                            Image(systemName: "square.and.arrow.down.fill")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        .foregroundColor(.black)
                        .padding(.trailing, 15)
                    }
                }
            }.animation(.spring(response: 0.6, dampingFraction: 0.6, blendDuration: 0.6))
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
