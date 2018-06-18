//
//  btnBorderRadius.swift
//  jeansExercise
//
//  Created by Yessine Kebir on 18/06/18.
//  Copyright © 2018 YSN. All rights reserved.
//

import UIKit
@IBDesignable  // Serve per rendere visibili le modifiche sull'IDE di XCode.. Senza esso, le modifiche vengono applicate ma sono visibili solo nel simulatore.
class btnBorderRadius: UIButton {

    @IBInspectable var cornerRadius : CGFloat {//CG > Core Graphic Float , un valore di float che viene utilizzato per i valori di grafica
        get {
            return self.layer.cornerRadius
        }
        set (newValue){
            self.layer.cornerRadius = newValue
        }
    }

}
