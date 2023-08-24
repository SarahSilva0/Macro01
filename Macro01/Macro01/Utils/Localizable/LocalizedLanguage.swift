//
//  LocalizedLanguage.swift
//  Macro01
//
//  Created by Higor  Lo Castro on 24/08/23.
//

import Foundation

//Transformar as Strings no idioma que está o celular
extension String {
    func localizedLanguage() -> String {
        return NSLocalizedString(
            self,
            tableName: "Localizable",
            bundle: .main,
            value: self,
            comment: self
        )
    }
}
