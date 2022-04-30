//
//  File.swift
//  
//
//  Created by Klaus-Dieter Reiners on 17.03.22.
//

import Foundation
public extension Date {
    init(_ dateString:String) {
        let dateStringFormatter = DateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let date = dateStringFormatter.date(from: dateString)!
        self.init(timeInterval:0, since:date)
    }
    func nearestClusterTime(resolution: Int) -> Date? {
        var components = NSCalendar.current.dateComponents([.minute], from: self)
        let minute = components.minute ?? 0
        let second = components.second ?? 0
        components.minute = minute >= resolution/60 ? resolution/60 - minute : -minute
        components.second = -second
        return Calendar.current.date(byAdding: components, to: self)
    }
}
