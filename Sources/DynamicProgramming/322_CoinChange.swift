//
//  322_CoinChange.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-09-14.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:322 Coin Change
	URL: https://leetcode.com/problems/coin-change/
	Space: O(n^2)
	Time: O(n)
 */

class CoinChange_Solution {
  func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    guard let minimumDenomination = coins.min() , minimumDenomination <= amount else {
      return amount == 0 ? 0 : -1
    }
    var coinsNum = Array(repeating: -1, count: amount + 1)
    for i in 1...amount {
      for j in coins where j <= i {
        if j == i {
          coinsNum[i] = 1
          break
        } else if coinsNum[i - j] != -1 {
          if coinsNum[i] == -1 {
            coinsNum[i] = coinsNum[i - j] + 1
          } else {
            coinsNum[i] = min(coinsNum[i], coinsNum[i - j] + 1)
          }
        }
      }
    }
    return coinsNum[amount]
  }
  
  func test() {
    let test1 = coinChange([1], 0)
    print(test1)
  }
}
