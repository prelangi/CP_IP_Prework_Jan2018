/*
Given an array, find the next greater element G[i] for every element A[i] in the array. The Next greater Element for an element A[i] is the first greater element on the right side of A[i] in array. 
More formally,

G[i] for an element A[i] = an element A[j] such that 
    j is minimum possible AND 
    j > i AND
    A[j] > A[i]
Elements for which no greater element exist, consider next greater element as -1.

Example:

Input : A : [4, 5, 2, 10]
Output : [5, 10, 10, -1]

Example 2:

Input : A : [3, 2, 1]
Output : [-1, -1, -1]
*/

import Foundation

class Solution {
	func nextGreater(_ A: inout [Int]) -> [Int] {
	    var nge = -1
	    
	    for i in 0..<A.count {
	        nge = -1
	        for j in i+1..<A.count {
	            if(A[j]>A[i]) {
	                nge = A[j]
	                break
	            }
	        }
	        
	        A[i] = nge
	    }
	    
	    return A

	}
}