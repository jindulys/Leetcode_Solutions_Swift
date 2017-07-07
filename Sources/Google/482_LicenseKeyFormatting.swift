//
//  LicenseKeyFormatting.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2017-07-06.
//  Copyright © 2017 YANSONG LI. All rights reserved.
//

import Foundation

class LicenseKeyFormattingSolution {
  func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
    // O(n)
    let reversedCharacters = Array(S.characters).reversed()
    var groups: [[Character]] = []
    var currentGroup: [Character] = []
    for character in reversedCharacters {
      if currentGroup.count == K {
        groups.append(currentGroup)
        currentGroup = []
      }
      if character == "-" {
        continue
      }
      currentGroup.append(character)
    }
    if currentGroup.count > 0 {
      groups.append(currentGroup)
    }
    groups = groups.reversed()
    return groups.map { String($0.reversed()).uppercased() }.reduce("") { current, nextGroup in
      if current == "" {
        return nextGroup
      } else {
        return current + "-" + nextGroup
      }
    }
  }
  
  static func test() {
    let solution = LicenseKeyFormattingSolution()
    let result = solution.licenseKeyFormatting("2-4A0r7-4k", 4)
    if result == "24A0-R74K" {
      print("Pass")
    } else {
      print("Failed")
    }
  }
}
