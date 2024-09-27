//
//  DailyScore.swift
//  Test
//
//  Created by Anurag Kashyap on 7/29/24.
//

import Foundation
import SwiftData

@Model
class DailyScore {
    var date: Date
    var pucaiScore: Int
    var numStools: String
    var rectalBleeding: String
    var pain: String
    var stool: String
    var energy: String
    var nocturnal: String
    
    init(date: Date, score: Int, numStools: String, rectalBleeding: String, pain: String, stool:String, energy:String, nocturnal:String) {
        self.date = date
        self.pucaiScore = score
        self.numStools = numStools
        self.rectalBleeding = rectalBleeding
        self.pain = pain
        self.stool = stool
        self.energy = energy
        self.nocturnal = nocturnal
        }
}
