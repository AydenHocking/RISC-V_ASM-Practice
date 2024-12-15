.data
globalArray: .word 1, 2, 3, 4	# global array with four integer elements
loopArray: .space 20 		# loop array with 5 integer elements, not intialized with values 

.text
main:
    la t1, globalArray		# load address of global array 
    lw t2, 0(t1)		# load globalArray[0] to t2
    slli t2, t2, 2		# t2 = t2 * 4
    sw t2, 4(t1)		# store t2 in globalArray[1]
    
    la t3, loopArray		# load address of loop array
    addi t4, zero, 5		# size limiter	
    addi t5, zero, 0		# counter j
    
loop:
    bge t5, t4, exitloop	# if count>limiter exit loop
    
    slli t0, t5, 2		# t0 = j * 4
    addi t0, t0, 2		# t0 = t0 + 2
    sw t0, 0(t3)		# store t0 in loopArray[i]
    
    add a0, t0, zero		# add t0 value to a0 for printing
    addi a7, zero, 1		# set syscall code for print integer
    ecall			# syscall
    
    addi a0, zero, 10        	# ASVCII value for \n
    addi a7, zero, 11        	# set syscall code for print character
    ecall		     	# syscall
    
    addi t3, t3, 4  		# move pointer by 4 bytes, next element
    addi t5, t5, 1		# j++
    j loop			# jump loop
exitloop:
    addi a0, zero, 0		# exit status code
    addi a7, zero, 10		# syscall to exit
    ecall			# syscall