.data
result: .word 0  	#space for result

.text
multiplyByEight:
    addi sp, sp, -8     #Allocate space
    sw s0, 0(sp)	#Store s0 to stack
    sw ra, 4(sp)	#Store ra on stack
    
    addi s0, a0, 0	
    slli a0, a0, 3	# a0 * 8
    slli a1, a1, 3	# a1 * 8
    add a0, a1, a0	# a1+a0
    
    lw ra, 4(sp)	# load ra back to stack 
    lw s0, 0(sp)	# load s0 back to stack 
    addi sp, sp, 8	# move back stack pointer
    jr ra 		# jump to address ra
addAndMultiply:
    addi sp, sp, -16	# allocate space
    sw s0, 0(sp)	# set s0 to 0 on stack pointer
    sw s1, 4(sp)	# set s1 to 4 on stack pointer
    sw s2, 8(sp)	# set s2 to 8 on stack pointer
    sw ra, 12(sp)	# set ra to 12 on stack pointer
    
    addi s0, a0, 0	# save a0 value
    addi s1, a1, 0	# save a1 value
    add a2, a0, a1	# a2 = a1 + a0
    
    addi a0, a2, 0	# set a0 to sum 
    addi a1, s1, 0	# set a1 back to original value 
    jal ra, multiplyByEight	#multiplyByEight
    addi s2, a0, 0	# put result of multiply by eight in s2
    
    addi a0, s0, 0	# set a0 back to original value
    addi a1, s2, 0	#set a1 to result of multiply by eight
    jal ra, multiplyByEight	# multiply by eight   
    add a0, s2, a0	# sum both multiply by eights 
    
    lw ra, 12(sp)	# restore original state
    lw s2, 8(sp)	# restore original state
    lw s1, 4(sp)	# restore original state
    lw s0, 0(sp)	# restore original state
    addi sp, sp, 16	# deallocate space
    jr ra

main:
    sw ra, 0(sp)	# set return address
    addi a0, a0, 4	# inputs
    addi a1, a1, 7	# inputs 
    jal ra, addAndMultiply	# call function
    la t0, result	# set t0 to the result 
    sw a0, 0(t0)	# save result of function 
    lw ra, 0(sp)	# restore original state 
    jr ra		# call result
    
