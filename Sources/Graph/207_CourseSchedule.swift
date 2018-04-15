//
//  207_CourseSchedule.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2018-04-15.
//  Copyright © 2018 YANSONG LI. All rights reserved.
//

/**
 Title: 207 Course Schedule
 URL: https://leetcode.com/problems/course-schedule
 Space: O(|E| + |V|)
 Time: O(|E| + |V|)
 */

class CourseSchedule {
  func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    guard numCourses > 0 else {
      return true
    }
    // Graph represents current index is a prerequisity of which other courses.
    var graph: [[Int]] = Array(repeatElement([], count: numCourses))
    var prerequisitesCount: [Int] = Array(repeatElement(0, count: numCourses))
    for requirements in prerequisites {
      if requirements.count > 0 {
        let currentCourse = requirements[0]
        prerequisitesCount[currentCourse] += requirements.count - 1
        for i in 1..<requirements.count {
          let requiredCourse = requirements[i]
          graph[requiredCourse] += [currentCourse]
        }
      }
    }
    var toBeHandled: [Int] = []
    for course in 0..<numCourses {
      if prerequisitesCount[course] == 0 {
        toBeHandled.append(course)
      }
    }
    var removed = 0
    while !toBeHandled.isEmpty {
      let currentCourse = toBeHandled.removeLast()
      removed += 1
      for course in graph[currentCourse] {
        prerequisitesCount[course] -= 1
        if prerequisitesCount[course] == 0 {
          toBeHandled.append(course)
        }
      }
    }
    return removed == numCourses
  }
}
