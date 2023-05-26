//
//  Onboarding.swift
//  Baca
//
//  Created by Fransiskus Anggara on 22/05/23.
//

import SwiftUI
import UIKit



struct Onboarding: View {
    @State private var xPosition: CGFloat = 2.3
    @State private var isLinkActive = false
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    Image ("Book_Onboard")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 64)
                    
                    GeometryReader { geometry in
                        Image ("Phone_Onboard")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .position(x: geometry.size.width / xPosition, y : geometry.size.height / 1.4)
                            .onAppear {
                                withAnimation(.easeInOut(duration:2)) {
                                    xPosition = 1.7
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isLinkActive = true
                                    print("isLinkActive: \(isLinkActive)")
                                }
                            }
                    }
                    .frame(height: 200)
                }
                Text("Scan a book to see the review.")
                Spacer()
                    .frame(height:20)
                NavigationLink(destination: ContentView2()) {
                    ZStack{
                        VStack{
                            Spacer()
                                .frame(height:15)
                            Rectangle()
                                .frame(width: 60, height: 10)
                                .foregroundColor(Color(red: 251/255, green: 247/255, blue: 25/255))
                        }
                        
                        Text("Start")
                            .foregroundColor(.black)
                            .bold()
                    }
                    
                }
            }
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
