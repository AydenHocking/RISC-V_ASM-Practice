main:
    # Initialize three registers (a0,a1,a2) with predefined different values
    addi a0, x0, 5         		# Add value in a0, to value in x0
    addi a1, x0, 10        		# Add value in a1, to value in x0
    addi a2, x0, 15        		# Add value in a2, to value in x0

    # Check a0 > a1
    bgt a0, a1, greater1  		# If t0 <= t1, jump to greater
    # Check a0 <= a1
    ble a0, a1, lessequal  		# If t0 <= t1, jump to lessequal

# If a0 > a1
greater1:
    addi a3, x0, 10       		# Add 10 in a0, to value in x0, to compare with a2
    bgt a2, a3, greater2 		# If a2 > 10, jump greater2
    j less        			# Jump to less

# If a2 > 10
greater2:
    addi a0, a0, 5   			# a0 = a0 + 5 (Add 5)
    j end            			# Jump to end

# If a2 <= 10
less:
    addi a0, a0, -5  			# a0 = a0 + -5 (Subtract 5)
    j end            			# Jump to end

# If a0 <= a1
lessequal:
    addi a1, a1, -2  			# a1 = a1 + -2 (Subtract 2)
    j end            			# Jump to end
# Ends program 
end:
				# Entire program will end in same place, regardless of result0