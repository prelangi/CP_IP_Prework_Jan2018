/*
Given an array of non negative integers A, and a range (B, C), 
find the number of continuous subsequences in the array which have sum S in the range [B, C] or B <= S <= C

Continuous subsequence is defined as all the numbers A[i], A[i + 1], .... A[j]
where 0 <= i <= j < size(A)

Example :

A : [10, 5, 1, 0, 2]
(B, C) : (6, 8)
ans = 3 
as [5, 1], [5, 1, 0], [5, 1, 0, 2] are the only 3 continuous subsequence with their sum in the range [6, 8]

 NOTE : The answer is guranteed to fit in a 32 bit signed integer. 
*/

import Foundation

class Solution {
	func numRange(_ A: inout [Int], _ B: inout Int, _ C: inout Int) -> Int {
	    var first = 0, second = 0, count = 0
        var sum = 0
        var arrCount = A.count


        while first < arrCount { 
            sum = 0
    
            for second in first..<arrCount {
                sum += A[second]
        
                if(sum>=B && sum<=C) {
                    count+=1
                }
                else if(sum > C) {
                    break;
                }
            }
            first+=1
        }
        return count
	}
}
