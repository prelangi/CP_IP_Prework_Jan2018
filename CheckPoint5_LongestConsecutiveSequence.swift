/*
Given an unsorted array of integers, find the length of the longest consecutive elements sequence.

Example: 
Given [100, 4, 200, 1, 3, 2],
The longest consecutive elements sequence is [1, 2, 3, 4]. Return its length: 4.

Your algorithm should run in O(n) complexity.
*/

import Foundation

class Solution {
	func longestConsecutive(_ A: [Int]) -> Int {
        var uniqueElemsInArray: Set<Int> = Set()
        var ans = 0, longestSeqLength = 0
        var j = 0
        
        //Add elements to the set
        for i in 0..<A.count {
            uniqueElemsInArray.insert(A[i])
        }
        
        for i in 0..<A.count {
            //Look for the element which is the first element of the sequence
            //Set will not contain A[i]-1 when it is the first element
            if(!uniqueElemsInArray.contains(A[i]-1)) {
                j = A[i]
                ans = 0
                 
                //Check for the longest consecutive sequence by looking for adj elements
                while(uniqueElemsInArray.contains(j)) {
                    j+=1
                    ans+=1
                }
            }
            
            longestSeqLength = max(longestSeqLength,ans)
        }
        return longestSeqLength
	}
}
