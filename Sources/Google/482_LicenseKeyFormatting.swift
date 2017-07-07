//
//  LicenseKeyFormatting.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2017-07-06.
//  Copyright © 2017 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title: 482 Licensekey formatting solution.
	URL: https://leetcode.com/problems/license-key-formatting/#/description
	Space: O(n)
	Time: O(n)
 */

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

  func licenseKeyFormatting_simplified(_ S: String, _ K: Int) -> String {
    // O(n)
    let reversedCharacters = Array(S.characters).reversed()
    var characters: [Character] = []
    var count = 0
    for character in reversedCharacters {
      if character == "-" {
        continue
      }
      if count == K {
        characters.append("-")
        count = 0
      }
      characters.append(character)
      count += 1
    }
    if let last = characters.last, last == "-" {
      characters.removeLast()
    }
    return String(characters.reversed()).uppercased()
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
