.text
.globl main

insertion_sort:
    addi	$sp, $sp, -12		# $sp = sp1 -12 
    sw		$a0, 0($sp)
    sw		$a1, 4($sp)
    sw		$ra, 8($sp) 
    addi	$t0, $zero, 1       # int i = 1 // t0 = i 	
    addi    $t1, $zero, 0       # t1 = j 
    addi    $t2, $zero, 0       # t2 = key
    add     $t3, $zero, $a1     # t3 = n
    add     $t4, $zero, $a0     # t4 = array_start_position
    add     $t5, $zero, $t1     # offset

first_loop:
    bge     $t0, $t3, exit
    sll     $t5, $t0, 2         # t5 = offset  //  i * 4 for offset
    add     $t5, $t5, $t4       # t5 is the offset + array_start_position
    lw		$t2, 0(t5)		    # load the arr[i] to key
    addi    $t1, $t0, -1        # j = i - 1

second_loop:
    blt		$t1, $zero, second_loop_exit    # if (j>=0) not true go to while exit 
    sll     $t6, $t1, 2                     # j * 4 = offset   
    add     $t6, $t6, $t4
    lw      $t7, 0(t6)                      # t7 = arr[j]
    ble     $t7, $t2 ,second_loop_exit      # if arr[j] <= key go to second_loop_exit
    addi    $t6, $t6, 4
    add     $t8, $zero, $t7                 # t8 = temp = arr[j]
    lw      $t9, 0($t6)                     # load arr[j+1] into t9      
    sw      $t9, -4($t6)                    # arr[j] = arr[j+1]
    sw      $t8, 0($t6)                     # arr[j+1] = temp
    addi    $t1, $t1, -1                    # j = j-1
    j second_loop
second_loop_exit:
    sll     $t1, 2      
    add     $t8, $t1, $t4
    sw      $t2, 4($t8)                     # arr[j+1] = key
exit:
    lw		$a0, 0($sp)
    lw		$a1, 4($sp)
    lw		$ra, 8($sp) 
    jr      $ra  
.data
myarray .word 3,9,7,5,1,11
