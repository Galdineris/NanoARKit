//
//  GameSettingsModel.swift
//  caretAR
//
//  Created by Rafael Galdino on 19/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation

struct GameSettingsModel {
    var expressions: [String: (Bool, String)]
    init(expressions: [String: (Bool, String)] = defaultExpressions) {
        self.expressions = expressions
    }
}

let defaultExpressions: [String: (Bool, String)] = [
    "tongueOut": (true, "Língua para fora"),
    "smile": (true, "Sorriso"),
    "eyeUp": (true, "Olhar para cima"),
    "browUp": (true, "Levantar sobrancelhas"),
    "leftEyeBlink": (true, "Piscar o olho esquerdo"),
    "rightEyeBlink": (true, "Piscar o olho direito"),
    "mouthOpen": (true, "Abrir a boca"),
    "mouthPuff": (true, "Encher as bochechas"),
    "lookLeft": (true, "Olhar para a esquerda"),
    "lookRight": (true, "Olhar para a direita")
]
