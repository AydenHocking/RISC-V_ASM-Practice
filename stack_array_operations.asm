part1:
    addi sp, sp, -16		# Allocate 16 bytes for array size of 4
    
    addi t0, zero, 1		# Add value 1 to t0
    sw t0, 0(sp)		# Store in first 4 byte space of stack
    addi t1, zero, 3		# Add value 3 to t1
    sw t1, 4(sp)		# Store in second 4 byte space of stack
    addi t2, zero, 5		# Add value 5 to t2
    sw t2, 8(sp)		# Store in third 4 byte space of stack
    addi t3, zero, 7		# Add value 7 to t3
    sw t3, 12(sp)		# Store in fourth 4 byte space of stack
    
    
    add t0, t0, t0		# Double first value (t0 = t0 + t0)
    sw t0, 4(sp) 		# Store first value in second 4 byte space
    
    addi sp, sp, 16		# Deallocate space
    j part2			# Jump part 2
    
part2:
    addi t3, zero, 0		# Ensure t3(sum) is 0 before proceeding 
    addi sp, sp, -12		# Allocate 12 bytes for array size of 3
    
    addi t4, zero, 3		# Add value 3 to t4(array size limiter)
    addi t5, zero, 0		# Add value 0 to t5(i/counter)
    
    addi t0, zero, 5		# Add value 5 to t0
    sw t0, 0(sp)		# Store in first 4 byte space of stack	
    addi t1, zero, 10		# Add value 10 to t1
    sw t1, 4(sp)		# Store in second 4 byte space of stack
    addi t2, zero, 15		# Add value 15 to t2
    sw t2, 8(sp)		# Store in third 4 byte space of stack

loop:
    bge t5, t4, exitloop	# If t5 >= t4 (counter >= limiter) jump exitloop
    
    lw t6, 0(sp)		# Load t6 with value of sp
    add t3, t3, t6		# Add t6(current array value) to t3 (t3 = t3 + t6)

    addi sp, sp, 4		# Move stack pointer by 4 (next array value)
    addi t5, t5, 1		# Add 1 to t5(counter) (t5 = t5 + 1)
    j loop			# Jump loop 
    
exitloop:     
    addi sp, sp, -4		# Allocate 4 bytes for sum to be stored
    sw t3, 12(sp)		# Store t3(sum) in fourth 4 byte space of stack
    
    addi sp, sp, 16		# Deallocate space 
    j end			# Jump end
end:
    addi a7, zero, 10		# Add exit call
    addi a0, zero, 0		# Add exit status code
    ecall			# Exit
