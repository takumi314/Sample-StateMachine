//
//  StateChange.swift
//  Sample-StateMachine
//
//  Created by NishiokaKohei on 21/12/2018.
//  Copyright © 2018 Takumi. All rights reserved.
//

import Foundation

enum StateChange<T> {
    case willChange(T)  // 状態遷移前を表現する
    case didChange(T)   // 状態遷移後を表現する
}
