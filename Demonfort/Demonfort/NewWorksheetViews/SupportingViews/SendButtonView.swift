//
//  SendButtonView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI
/**
    *To do:
        *handle errors for sending document
        *Alert if document was successfully sent
        *Alert if document was not successfully sent
        *Notification to the user at 15:00 to complete its worksheet
 */
//Alert(title: Text("Une feuille de temps existe déjà pour cette journée."), message: Text("Envoyer la feuille de temps malgré tout?"), primaryButton: .default(Text("Non")), secondaryButton: .default(Text("Oui")))

struct SendButtonView: View {
    @EnvironmentObject var worksheet: Worksheet
    
    var body: some View {
        HStack{
            Spacer()
            
            Button(action: {
                //if worksheet exist for this worker on this date:
                if(true){
                    //self.show2SheetsAlert = true
                    self.worksheet.database.collection("worksheets").addDocument(data: ["Employee": "Samuel Proulx", "StartTime": self.worksheet.start, "EndTime": self.worksheet.end, "Tasks": self.worksheet.tasks])
                }
                
            }/*End of button action*/) {
                //ButtonAlerts()
                Text("Envoyer")
                    .foregroundColor(Color("darkText"))
                    .fontWeight(.heavy)
                    .frame(width: 256)
                    
            }
                .padding([.vertical], 8)
                .background(Color("darkBackground"))
                .cornerRadius(10)
            
            Spacer()
        }
    }
    
}

struct SendButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SendButtonView()
    }
}

