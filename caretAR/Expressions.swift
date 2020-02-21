//
//  Expressions.swift
//  caretAR
//
//  Created by Cassia Aparecida Barbosa on 20/02/20.
//  Copyright © 2020 Rafael Galdino. All rights reserved.
//

import Foundation
import ARKit

struct Expression {
    var name: String
    var threshold: Float
    var enabled: Bool
    var details: String
    var blendShapes: [ARFaceAnchor.BlendShapeLocation]
    init(_ name: String, threshold: Float, enabled: Bool, details: String, blendShapes: [ARFaceAnchor.BlendShapeLocation]) {
        self.name = name
        self.threshold = threshold
        self.enabled = enabled
        self.details = details
        self.blendShapes = blendShapes
    }
    init() {
        self.name = ""
        self.threshold = 0.0
        self.enabled = false
        self.details = ""
        self.blendShapes = [ARFaceAnchor.BlendShapeLocation.browDownLeft]
    }
}

let defaultExpressions: [Expression] = [
    Expression.init("tongueOut",
                    threshold: Float(0.5),
                    enabled: true,
                    details: "Língua para fora",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.tongueOut]),
    Expression.init("smile",
                    threshold: Float(0.5),
                    enabled: true,
                    details: "Sorrir",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.mouthSmileRight, ARFaceAnchor.BlendShapeLocation.mouthSmileLeft]),
    Expression.init("eyeUp",
                    threshold: Float(0.6),
                    enabled: true ,
                    details: "Olhar para cima",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.eyeLookUpLeft, ARFaceAnchor.BlendShapeLocation.eyeLookUpRight]),
    Expression.init("browUp",
                    threshold: Float(0.7),
                    enabled: true,
                    details: "Levantar sobrancelhas",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.browInnerUp]),
    Expression.init("leftEyeBlink",
                    threshold: Float(0.6),
                    enabled: true,
                    details: "Piscar o olho esquerdo",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.eyeBlinkLeft]),
    Expression.init("rightEyeBlink",
                    threshold: Float(0.6),
                    enabled: true,
                    details: "Piscar o olho direito",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.eyeBlinkRight]),
    Expression.init("mouthOpen",
                    threshold: Float(0.7),
                    enabled: true,
                    details: "Abrir a boca",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.jawOpen]),
    Expression.init("lookLeft",
                    threshold: Float(0.9),
                    enabled: true,
                    details:"Olhar para a esquerda",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.eyeLookOutLeft]),
    Expression.init("lookRight",
                    threshold: Float(0.9),
                    enabled: true,
                    details: "Olhar para a diretia",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.eyeLookOutRight]),
    Expression.init("mouthPuff",
                    threshold: Float(0.4),
                    enabled: true,
                    details: "Encher as bochechas",
                    blendShapes: [ARFaceAnchor.BlendShapeLocation.cheekPuff])
]
