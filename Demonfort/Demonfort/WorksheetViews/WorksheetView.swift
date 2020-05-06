//
//  WorksheetView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-17.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct WorksheetView: View {
    //change to worker when will be able to retrieve data from workerWorksheets
    @EnvironmentObject var worksheet: Worksheet
    
//    var drag: some Gesture{
//        DragGesture(){_ in
//            .onEnded{
//                self.worksheet.refresh()
//                
//            }
//        }
//    }
    
    
    var body: some View {
        NavigationView{
            /**
                *To do:
                - Lock Navigation View title so that it scrolls with the list instead of staying in place
                - Insert optionnal error message under Navigation View title if loading documents from firebase was to fail
                - Make WorksheetRowView() retrieve its data from Worksheet.worksheets
                - Make the list adjust for the number of documents retrieved from firebase
             */
            //self.worksheet.workerWorksheets.first(where: ("Simon Fonseca0" ))
            //for each:::::worksheet.workerWorksheets.count
            List{
                ForEach(0..<self.worksheet.numOfDocs){_ in
                    NavigationLink(destination: WorksheetDetailView()){
                        WorksheetRowView(startTime: Date(), endTime: Date(), workPlace: "Some place")
                    }
//                    WorksheetRowView(startTime: self.worksheet.worksheets, endTime: self.worksheet.end, workPlace: "123, rue Maisonneuve, Montréal")
                }
            }.navigationBarTitle("Feuilles de temps")
            .gesture(
                DragGesture()
                    //refresh festure
            )
        }
    }
}

struct WorksheetView_Previews: PreviewProvider {
    static var previews: some View {
        WorksheetView().environmentObject(Worksheet())
    }
}
