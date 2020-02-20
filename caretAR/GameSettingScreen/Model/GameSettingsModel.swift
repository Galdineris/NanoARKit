//
//  GameSettingsModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

struct GameSettingsModel {
    var expressions: [Expression]
    init(expressions: [Expression] = defaultExpressions) {
        self.expressions = expressions
    }
}
