//
//  WorksheetCorrectionView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-05-07.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetCorrectionView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        VStack {
            if(self.worksheet.workerRole == .superintendent) {
                HStack{
                    Button(action: {
                        //
                    }) {
                        Text("Refuser")
                            .fontWeight(.bold)
                    }.padding([.vertical], 20)
                        .frame(width: 120)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    
                    Spacer()
                        .frame(width: 80)
                    
                    Button(action: {
                        //set status to .approved
                    }) {
                        Text("Accepter")
                            .fontWeight(.bold)
                    }.padding([.vertical], 20)
                        .frame(width: 120)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
    }
}

struct WorksheetCorrectionView_Previews: PreviewProvider {
    static let worksheet = Worksheet(email: "samuelproulx26@gmail.com")
    
    static var previews: some View {
        WorksheetCorrectionView().environmentObject(worksheet)
    }
}
