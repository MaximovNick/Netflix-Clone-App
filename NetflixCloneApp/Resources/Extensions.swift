//
//  Extensions.swift
//  NetflixCloneApp
//
//  Created by Nikolai Maksimov on 30.07.2022.
//

import Foundation


extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
