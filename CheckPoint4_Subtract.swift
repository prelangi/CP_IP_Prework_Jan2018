/*
Given a singly linked list, modify the value of first half nodes such that :

1st node’s new value = the last node’s value - first node’s current value
2nd node’s new value = the second last node’s value - 2nd node’s current value,
and so on …

 NOTE :
If the length L of linked list is odd, then the first half implies at first floor(L/2) nodes. So, if L = 5, the first half refers to first 2 nodes.
If the length L of linked list is even, then the first half implies at first L/2 nodes. So, if L = 4, the first half refers to first 2 nodes.
Example :

Given linked list 1 -> 2 -> 3 -> 4 -> 5,

You should return 4 -> 2 -> 3 -> 4 -> 5
as

for first node, 5 - 1 = 4
for second node, 4 - 2 = 2
Try to solve the problem using constant extra space.
*/


import Foundation

/**
 * Definition for a linked list node
 *
 * class ListNode {
 *    var val: Int = 0
 *    var next: ListNode?
 * }
 *
 */

class Solution {
	func subtract(_ A: ListNode?) -> ListNode? {
        var fast = A
        var slow = A
        var curr = A
        var secondHalfReversed: ListNode?
        var reverseList: ListNode?
        
        //print("/// Actual List ////")
        //printLL(A)
        
        while(fast?.next != nil && fast?.next?.next != nil) { 
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        if(slow?.next != nil) {
            secondHalfReversed = reverse(slow?.next)
            //print("/// Reversed Second Half //// ")
            //printLL(secondHalfReversed)
        }
        
        reverseList = secondHalfReversed
        
        while(secondHalfReversed != nil) {
            curr!.val = secondHalfReversed!.val - curr!.val
            curr = curr?.next
            secondHalfReversed = secondHalfReversed?.next
        }
        
        slow?.next = reverse(reverseList)
        //print("/// Result List //// ")
        //printLL(A)
        
        return A
        
        
	}
	
	func printLL(_ A: ListNode?) {
	    var node = A
	    while(node != nil) {
	        if(node?.next == nil) {
	            print("\(node!.val)")
	        }
	        else {
	            print("\(node!.val)->",terminator:"")
	       }
	        
	       node = node?.next
	    }
	}
	
	func reverse(_ A: ListNode?) -> ListNode? {
	    var prev:ListNode?
	    var current = A
	    var temp: ListNode?
	    
	    while current != nil {
	        temp = current?.next
	        current?.next = prev
	        prev = current
	        current = temp
	    }
	    return prev
	}
}
