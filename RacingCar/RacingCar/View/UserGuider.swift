//
//  UserGuider.swift
//  RacingCar
//
//  Created by 강수진 on 2022/04/30.
//

import Foundation

protocol UserInformable {
    var guideDescription: String { get }
}

struct UserGuider {
    func guide(for information: UserInformable) {
        print(information.guideDescription)
    }
}
