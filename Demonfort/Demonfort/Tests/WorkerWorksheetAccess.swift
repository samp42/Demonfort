//
//  WorkerWorksheetAccess.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-21.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Foundation

class WorkerWorksheet{
    var status: [Any]
    var worksheets: [String:Any]
    var n: Int8
    
    init(worker: [String:Any], num: Int8){
        //super.init()
        status = []
        self.worksheets = worker
        self.n = num
    }
    
    func getStatus() -> Void{
        //search for status in every sheet
        for _ in 0..<n{
            for (key, value) in worksheets{
                if(key=="Status" && type(of: value)==String.self){
                    self.status.append(value)
                }
            }
        }
        
        if(status.isEmpty){
            print("STATUS EMPTY")
        } else {
            for i in status{
                print(i)
            }
        }
    }
    
}
