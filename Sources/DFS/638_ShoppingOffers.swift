//
//  638_ShoppingOffers.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-21.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 638 Shopping Offers
 URL: https://leetcode.com/problems/shopping-offers
 Space: O(N)
 Time: O(N^2)
 */

class ShoppingOffers {
  func shoppingOffers(_ price: [Int], _ special: [[Int]], _ needs: [Int]) -> Int {
    var bestPrice: Int = Int.max
    for i in 0..<special.count {
      var adjustedNeeds = needs
      var isValidOffer = true
      for j in 0..<special[i].count - 1 {
        if special[i][j] > needs[j] {
          isValidOffer = false
          break
        }
        adjustedNeeds[j] = adjustedNeeds[j] - special[i][j]
      }
      if !isValidOffer {
        continue
      }
      bestPrice = min(bestPrice, shoppingOffers(price, special, adjustedNeeds) + special[i][special[i].count - 1])
    }
    let noDiscountPrice = zip(price, needs).reduce(0) { $0 + $1.0 * $1.1}
    return min(bestPrice, noDiscountPrice)
  }
}
