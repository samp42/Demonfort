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
                
                //if worksheet exist for this worker on this date:
                if(true){
                    //self.show2SheetsAlert = true
                    self.worksheet.status = Status.sent
                    //update the number of documents, helps identifying documents
                    self.worksheet.numOfDocuments+=1
                    //send data with specific document name
                    self.worksheet.database.collection("worksheets").document("\(self.worksheet.name)\(self.worksheet.numOfDocuments)")
                        .setData(["Employee": "Samuel Proulx", "StartTime": self.worksheet.start, "EndTime": self.worksheet.end, "Tasks": self.worksheet.tasks, "Status": self.worksheet.status.rawValue], merge: true)
                    //old way to add the document
                    //self.worksheet.database.collection("worksheets").addDocument(data: ["Employee": "Samuel Proulx", "StartTime": self.worksheet.start, "EndTime": self.worksheet.end, "Tasks": self.worksheet.tasks, "Status": self.worksheet.status.rawValue])
                    self.worksheet.reset()
                    //output debugging
                    for documentID in self.worksheet.workerWorksheets{
                        print("documentID:\(documentID)|||||")
                        for (key,value) in documentID.value{
                            print("(key:\(key),value:\(value))")
                        }
                    }
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

