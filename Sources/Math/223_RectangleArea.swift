//
//  223_RectangleArea.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-11-12.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:223 Rectangle Area
	URL: https://leetcode.com/problems/rectangle-area/
	Space: O(1)
	Time: O(1)
 */

class RectangleArea_Solution {
  func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
    let totalArea = (C - A) * (D - B) + (G - E) * (H - F)
    if A >= G || C <= E || B >= H || D <= F {
      return totalArea
    }
    let startX = max(A, E)
    let endX = min(C, G)
    let startY = max(B, F)
    let endY = min(D, H)
    return totalArea - (endX - startX) * (endY - startY)
  }
}
