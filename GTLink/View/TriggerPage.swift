//
//  TriggerPage.swift
//  GTLink
//
//  Created by James Ryzhkov on 12/3/22.
//

import SwiftUI

struct TriggerPage: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        NavigationStack {
            LandingPage().environmentObject(userVM)
        }
    }
}

struct TriggerPage_Previews: PreviewProvider {
    static var previews: some View {
        TriggerPage()
    }
}
