/*
Given a collection of numbers that might contain duplicates, return all possible unique permutations.

Example :
[1,1,2] have the following unique permutations:

[1,1,2]
[1,2,1]
[2,1,1]
 NOTE : No 2 entries in the permutation sequence should be the same. 
 Warning : DO NOT USE LIBRARY FUNCTION FOR GENERATING PERMUTATIONS. Example : next_permutations in C++ / itertools.permutations in python.
If you do, we will disqualify your submission retroactively and give you penalty points. 
*/

import Foundation

class Solution {
	func permute(_ A: inout [Int]) -> [[Int]] {
        var result:[[Int]] = []
        permuteUnique(&A,0,&result)
        
        return result
	}
	
	func swap(_ A: inout [Int],_ pos1: Int, _ pos2: Int) {
	    var temp = A[pos1]
	    A[pos1] = A[pos2]
	    A[pos2] = temp
	}
	
	//Check if any of the elements in the array match with the element we are swapping
	//If they match, it will be a duplicate and will not be used to do any more permutations
	func notADuplicate(_ A: inout [Int], _ startPos: Int, _ swapPos: Int)->Bool {
        if(swapPos > startPos) {
	        var endIndex = swapPos-1
	        for i in startPos...endIndex {
	            if A[i] == A[swapPos] {
	                return false
	            }
 	        }
	    }
 	    return true
	}
  
  	//Wrapper function to generate unique permutations
	func permuteUnique(_ A: inout [Int], _ startPos: Int, _ result: inout [[Int]]) {
	    
	    if startPos >= A.count {
	        result.append(A)
	    }
	    for i in startPos..<A.count {
	        if notADuplicate(&A,startPos,i) {
	            swap(&A,startPos,i)
	            permuteUnique(&A,startPos+1,&result)
	            swap(&A,startPos,i)
	        }
	    }
	}
}
