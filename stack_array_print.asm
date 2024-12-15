part1:
    addi sp, sp, -20		# Allocate 20 bytes for array size of 5
    
    addi t4, zero, 5		# Add value 5 to t4(array size limiter)
    addi t5, zero, 0		# Add value 0 to t5(i/counter)
    
loop:
    bge t5, t4, exitloop	# If t5 >= t4 (counter >= limiter) jump exitloop
    
    slli t1, t5, 1		# Multiply t5 (i) * 2 with left shift
    sw t1, 0(sp)		# Store new value where stack pointer is located
         
    addi sp, sp, 4		# Move stack pointer by 4 (next array value)
    addi t5, t5, 1		# Add 1 to t5(counter) (t5 = t5 + 1)
    j loop			# Jump loop
    
exitloop:
    addi sp, sp, -20		# Move the stackpointer to top of stack 
    lw t1, 0(sp)		# Load first array element, where sp is pointing, into t1
    slli t1, t1, 1		# Multiply t1 (array[0]) * 2 with left shift 
    sw t1, 8(sp)		# Store new t1 value into the third element
    
    addi t5, zero, 0		# Reset value 0 to t5(i/counter)
    j part2			# Jump part2
    
part2:

    bge t5, t4, exit		# If t5 >= t4 (counter >= limiter) jump exit
    
    lw t1, 0(sp)		# Load current array element, where sp is pointing, into t1
    add a0, t1, zero		# Add t1 value to a0 for printing
    addi a7, zero, 1		# Set syscall code for print integer
    ecall			# Invoke syscall

    addi a0, zero, 10          # ASVCII value for \n
    addi a7, zero, 11          # Syscall value for print character
    ecall		       # Invoke syscall
    
    
    addi sp, sp, 4		# Move stack pointer by 4 (next array value)
    addi t5, t5, 1		# Add 1 to t5(counter) (t5 = t5 + 1)
    j part2			# Jump part2
    
exit:
    addi sp, sp, 20		# Deallocate 20 bytes for array size of 5
    addi a7, zero, 10		# Add exit call
    addi a0, zero, 0		# Add exit status code
    ecall			# Exit
