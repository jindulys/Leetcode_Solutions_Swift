//
//  121_BestTimeToBuyAndSellStock.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-22.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:121 Best Time to Buy and Sell Stock
	URL: https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
	Space: O(1)
	Time: O(N)
 */

class BestTimeToBuyAndSellStock_Solution {
  func maxProfit(_ prices: [Int]) -> Int {
    guard prices.count > 1 else {
      return 0
    }
    var currentMin = prices[0]
    var bestTrade = 0
    for i in 0..<prices.count {
      if prices[i] < currentMin {
        currentMin = prices[i]
        continue
      }
      bestTrade = max(bestTrade, prices[i] - currentMin)
    }
    return bestTrade
  }
}
