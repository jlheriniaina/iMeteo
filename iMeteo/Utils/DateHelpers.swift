//
//  DateHelpers.swift
//  iMeteo
//
//  Created by lucas on 05/01/2019.
//  Copyright © 2019 lucas. All rights reserved.
//

import Foundation

public class DateHelpers {
    
    public static func hour(_ string: String) -> String?{
        if let date = convertDateString(string) {
            let format = DateFormatter()
            format.timeStyle = .short
            return format.string(from: date)
        }
        return nil
    }
    public static func doWeekDay(_ string: String) -> String? {
        if let date = convertDateString(string) {
            let calendar = Calendar.current
            if calendar.isDateInToday(date){
                return "Aujourd'hui"
            }else if calendar.isDateInTomorrow(date){
                return "Demain"
            }else {
                let day = calendar.component(.weekday, from: date)
                switch day {
                case 1 : return "Dimanche"
                case 2: return "Lundi"
                case 3: return "Mardi"
                case 4: return "Mercredi"
                case 5: return "Jeudi"
                case 6 : return "Vendredi"
                default : return "Samedi"
                }
                
            }
        }
        return nil
    }
    private static func convertDateString(_ string: String) -> Date? {
        let format = DateFormatter()
        format.dateFormat = "yyyy-mm-dd HH:mm:ss"
        if let date = format.date(from: string){
            return date
        }
        return nil
    }
}
