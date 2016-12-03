//
//  File.swift
//  LeetcodeSwift
//
//  Created by yansong li on 2016-12-01.
//  Copyright © 2016 YANSONG LI. All rights reserved.
//

import Foundation

/**
	Title:317 Shortest Distance from All Buildings
	URL: https://leetcode.com/problems/shortest-distance-from-all-buildings/
	Space: O(KMN)
	Time: O(MN)
 */

class ShortestDistanceFromAllBuildings_Solution {

  /// Min distance so far.
  var minDistance = -1

  /// Step directions.
  let stepDirections = [0, 1, 0, -1, 0]
  
  func shortestDistance(_ grid: [[Int]]) -> Int {
    guard grid.count > 0 else {
      return -1
    }
    var walkGrid = grid
    var dist =
        Array(repeating: Array(repeating: 0, count: grid[0].count), count: grid.count)
    var currentWalk = 0
    for i in 0..<walkGrid.count {
      for j in 0..<walkGrid[0].count {
        if walkGrid[i][j] == 1 {
          bfs(grid: &walkGrid, dist: &dist, walk: currentWalk, start: i, end: j)
          currentWalk -= 1
        }
      }
    }
    return minDistance
  }
  
  func bfs(grid: inout [[Int]], dist: inout [[Int]], walk: Int, start: Int, end: Int) {
    var scanQueue = Queue<(Int, Int, Int)>()
    scanQueue.enqueue((start, end, 0))
    minDistance = -1
    while !scanQueue.isEmpty() {
      let currentPoint = scanQueue.dequeue()!
      let depth = currentPoint.2
      for i in 0..<stepDirections.count - 1 {
        let newCheckPoint =
            (currentPoint.0 + stepDirections[i], currentPoint.1 + stepDirections[i + 1])
        if (newCheckPoint.0 >= 0 &&
          newCheckPoint.0 <= grid.count - 1 &&
          newCheckPoint.1 >= 0 &&
          newCheckPoint.1 <= grid[0].count - 1 &&
          grid[newCheckPoint.0][newCheckPoint.1] == walk ) {
          grid[newCheckPoint.0][newCheckPoint.1] = walk - 1
          scanQueue.enqueue((newCheckPoint.0, newCheckPoint.1, depth + 1))
          dist[newCheckPoint.0][newCheckPoint.1] += depth + 1
          if (minDistance == -1 || minDistance > dist[newCheckPoint.0][newCheckPoint.1]) {
            minDistance = dist[newCheckPoint.0][newCheckPoint.1]
          }
        }
      }
    }
  }
  
  func test() {
    let testGrid = [[1, 0, 2, 0, 1], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0]]
    let result = shortestDistance(testGrid)
    print(result)
  }
}
