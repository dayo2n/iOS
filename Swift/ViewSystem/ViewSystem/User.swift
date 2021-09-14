//
//  User.swift
//  ViewSystem
//
//  Created by 문다 on 2021/09/15.
//
import Foundation

class User {
    let id: UUID = UUID()
    let name: String
    let gender: User.Gender
    let birthDay: Date
    
    enum Gender: Int, CustomStringConvertible {
        case male, female
        
        var description: String {
            switch self {
            case .male :
                return "남성"
            case .female :
                return "여성"
            }
        }
    }
    
    init(name: String, gender: User.Gender, birthDay: Date) {
        self.name = name
        self.gender = gender
        self.birthDay = birthDay
    }
}
