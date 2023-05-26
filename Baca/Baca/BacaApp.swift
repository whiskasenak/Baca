//
//  BacaApp.swift
//  Baca
//
//  Created by Fransiskus Anggara on 22/05/23.
//

import SwiftUI

@main
struct BacaApp: App {
    
    @State var SplashShowed = true
    
    var body: some Scene {
        WindowGroup {
            if SplashShowed {
                Splash()
                    .preferredColorScheme(.light)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5)
                        {
                            SplashShowed = false
                        }
                    }
            } else {
                Onboarding()
                    .preferredColorScheme(.light)
            }
        }
    }
}
