//
//  Token.swift
//  PruebaSwift
//
//  Created by Jaime Uribe on 3/11/19.
//  Copyright © 2019 Jaime Uribe. All rights reserved.
//

import UIKit


protocol Tokens {
    var idToken: String { get set}
}


struct Token: Tokens {
    var _idToken: String = ""
    
    var idToken: String {
        get{
            return _idToken
        }
        set (newVal){
            _idToken = newVal
        }
    }
}
