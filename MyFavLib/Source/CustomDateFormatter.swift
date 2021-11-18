//
//  CustomDateFormatter.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 18/11/21.
//

import Foundation

public class CustomDateFormatter {
    public init() {}

    public func format12to24(date date12: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter.string(from: date12.toDate())
    }

    public func getDifferenceBetweenDatesInStringDate(from start: Date, to end: Date) -> String {
        var time = end.timeIntervalSince(start)
        if start > end { time += 24 * 60 * 60 }
        return timeIntervalToStringDate(time: time)
    }

    public func timeIntervalToStringDate(time: TimeInterval) -> String {
        let horas = time / 60 / 60
        let minutos = horas.truncatingRemainder(dividingBy: 1) * 60
        let segundos = minutos.truncatingRemainder(dividingBy: 1) * 60
        return "\(Int(horas)):\(Int(minutos)):\(Int(round(segundos)))"
    }
}
