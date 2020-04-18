//
//  TimeFormatter.swift
//  Demonfort
//
//  Created by Samuel Proulx on 2020-04-18.
//  Copyright © 2020 Demonfort. All rights reserved.
//

import Foundation

extension Date{
    func asString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d, HH:mm"
        dateFormatter.locale = Locale(identifier: "en_CA")
        return dateFormatter.string(from: self)
    }
    /*
     Wednesday, Sep 12, 2018            --> EEEE, MMM d, yyyy
     09/12/2018                         --> MM/dd/yyyy
     09-12-2018 14:11                   --> MM-dd-yyyy HH:mm
     Sep 12, 2:11 PM                    --> MMM d, h:mm a
     September 2018                     --> MMMM yyyy
     Sep 12, 2018                       --> MMM d, yyyy
     Wed, 12 Sep 2018 14:11:54 +0000    --> E, d MMM yyyy HH:mm:ss Z
     2018-09-12T14:11:54+0000           --> yyyy-MM-dd'T'HH:mm::ssZ
     12.09.18                           --> dd.MM.yy
     10:41:02.112                       --> HH:mm:ss.SSS
     */
}
