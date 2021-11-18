//
//  String+Extensions.swift
//  MyFavLib
//
//  Created by Miguel Bragado Sánchez on 18/11/21.
//

import Foundation

public extension String {
    public func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ssa"
        guard let date = dateFormatter.date(from: self) else {
            fatalError("Fail")
        }
        return date
    }
    public var localized: String {
        if UserDefaults.standard.string(forKey: "i18n_language") != nil {} else {
            UserDefaults.standard.set("es", forKey: "i18n_language")
            UserDefaults.standard.synchronize()
        }
        let language = UserDefaults.standard.string(forKey: "i18n_language")
        if let path = Bundle.main.path(forResource: language, ofType: "lproj") {
            guard let bundle = Bundle(path: path) else { return self }
            return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        } else { return self }
    }
}
