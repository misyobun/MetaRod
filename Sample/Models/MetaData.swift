//
//  MetaData.swift
//  Sample
//
//  Created by NaotoTakahashi
//  Copyright © 2020 msb. All rights reserved.
//

import Combine
import SwiftUI
import MetaRod

final class MetaData: ObservableObject {

    @Published var meta:[String:String] = [:]
    @Published var og:[String:String] = [:]
    
    func fetchOg() {
        DispatchQueue.global().async {
            do {
                let result = try MetaRod().build("https://www.vagrantup.jp/entry/2020/01/08/012539").og()
                DispatchQueue.main.async {
                    self.og = result
                }
            } catch {
                print("error")
            }
        }
    }
    
    func fetchMeta() {
        DispatchQueue.global().async {
            do {
                let result = try MetaRod().build("https://www.vagrantup.jp/entry/2020/01/08/012539").meta()
                DispatchQueue.main.async {
                    self.meta = result
                }
            }catch{
                print("error")
            }
        }
    }
}
