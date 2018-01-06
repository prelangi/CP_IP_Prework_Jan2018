import Foundation

class Solution {
	func prettyPrint(_ A: inout Int) -> [[Int]] {
        var B = 2*A-1
        var res = Array(repeating: Array(repeating: 0,count: B), count: B )
        
        //compute the A*A matrix first
        for i in 0..<A {
            for j in 0..<A {
                if(i-j>0) {
                    res[i][j] = A-j
                }
                else {
                    res[i][j] = A-i
                }
            }
        }

        //Use symmetry property to print the rest of the array
        for i in 0..<A {
            for j in A..<B {
                res[i][j] = res[i][B-1-j]
            }
        }

        //Using symmetry to print lower half of the array
        for i in A..<B {
            for j in 0..<B {
                res[i][j] = res[B-1-i][j]
            }
        }
        return res
	}
}
