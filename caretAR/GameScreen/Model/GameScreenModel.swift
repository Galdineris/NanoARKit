//
//  GameScreenModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

struct GameScreenModel {
    var expressions: [String: (Bool, String)]
    init(expressions: [String: (Bool, String)] = defaultExpressions) {
        self.expressions = expressions
    }

}
