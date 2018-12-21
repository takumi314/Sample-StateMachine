//
//  StateMachine.swift
//  Sample-StateMachine
//
//  Created by NishiokaKohei on 21/12/2018.
//  Copyright © 2018 Takumi. All rights reserved.
//

import Foundation
import RxSwift

class StateMachine<State, Event> {

    /// 始状態
    private(set) var current: State

    /// 状態遷移オブザーバー
    private let changedSubject = PublishSubject<StateChange<State>>()
    /// 状態遷移関数
    private let routing: (State, Event) -> State

    private let disposeBag = DisposeBag()

    // MARK: - Initializer

    init(_ initial: State, routing: @escaping (State, Event) -> State) {
        self.current = initial
        self.routing = routing
        self.changedSubject.disposed(by: disposeBag)
    }

    // MARK: - Public

    /// 遷移イベントする変更場合に必ずコールする
    func hop(by event: Event) {

        let next = routing(current, event)

        self.changedSubject.onNext( .willChange(current))
        self.current = next
        self.changedSubject.onNext( .didChange(next))
    }

}

