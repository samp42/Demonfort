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
                
                /**
                 Current issue:
                 - numOfDocuments resets at every instanciation (every time the app is opened) <=> the first document uploaded is *name*1 and not *name*(last+1)
                 - setData method allows to name the document, but document can be overriden which we don't want to happen when sending a **NEW** worksheet
                 */
  
                self.worksheet.sendWorksheet(employee: self.worksheet.workerName, start: self.worksheet.start, end: self.worksheet.end, status: self.worksheet.status, tasks: self.worksheet.tasks)
                self.worksheet.reset()
                
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
    static let worksheet = Worksheet()
    static var previews: some View {
        SendButtonView().environmentObject(Worksheet())
    }
}

