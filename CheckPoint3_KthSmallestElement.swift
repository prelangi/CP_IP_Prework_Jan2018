/*
Find the kth smallest element in an unsorted array of non-negative integers.

Definition of kth smallest element

 kth smallest element is the minimum possible n such that there are at least k elements in the array <= n.
In other words, if the array A was sorted, then A[k - 1] ( k is 1 based, while the arrays are 0 based ) 
NOTE
You are not allowed to modify the array ( The array is read only ). 
Try to do it using constant extra space.

Example:

A : [2 1 4 3 2]
k : 3

answer : 2
*/

import Foundation

class Solution {
	func kthsmallest(_ A: [Int], _ B: inout Int) -> Int {
        let pivot = A.first! 
        let smallerArray = A.dropFirst().filter { $0 <= pivot }
        let largerArray  = A.dropFirst().filter { $0 > pivot }
        let newArray = smallerArray + [Int(pivot)] + largerArray
        
        let pivotPosition = A.count>0 ? smallerArray.count : 0
        if B-1 == pivotPosition {
            return newArray[pivotPosition]
        }
        else if B-1 > pivotPosition {
            var newPivotPosition = B-1-pivotPosition
            return kthsmallest(largerArray, &newPivotPosition)
        }
        else {
            return kthsmallest(smallerArray, &B)
        }
	}
}
