//
//  AccountView.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-03-12.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var worksheet: Worksheet
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                    .frame(height: 100)
                HStack {
                    Text("\(self.worksheet.workerRole.toStringFrench())")
                    Spacer()
                }
                    NavigationLink(destination: SettingsView()){
                        HStack {
                            Spacer()
                            Text("Gérer les utilisateurs")
                                .font(.headline)
                                .fontWeight(.heavy)
                                .foregroundColor(Color.red)
                                .padding([.vertical], 6)
                            Spacer()
                        }.background(Color("darkBackground"))
                        .cornerRadius(8)
                    }
                    Spacer()
                    .frame(height: 20)
                    if(self.worksheet.workerRole==Role.worker){
                        HStack {
                            Text("Jours de la semaine")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        WeekDaysView()
                    }
                    Spacer()
                        .frame(height: 20)
                    HStack {
                        Text("Chantiers")
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                    }
                    UserWorkPlacesView()
                    Spacer()
                        .frame(height: 20)
                    if(self.worksheet.workerRole==Role.superintendent){
                        WorkerSheetsApprovalListView()
                    }
                    //Spacer()
                }.padding([.horizontal], 16)
                .navigationBarTitle(self.worksheet.workerName)
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(Worksheet())
    }
}
