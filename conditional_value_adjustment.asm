main:
    # Initialize two registers (s0,s1) with predefined values A and B
    addi s0, x0, 2          		# Add value A in s0, to value in x0
    addi s1, x0, 8         		# Add value B in s1, to value in x0

    # Check A < B
    blt s0, s1, less  			# If A < B, jump to less
    # Check A >= B
    bge s0, s1, greaterequal  		# If A >= B, jump to greaterequal

# If A < B
less:
    add s0, s0, s0    			# s0 = s0 + s0 (Double s0 or A)
    j end             			# Jump to end

# If A >= B
greaterequal:
    addi s1, s1, -3   			# s1 = s1 - 3 (Subtract 3)
    j end             			# Jump to end

# Ends program 
end:
					# Entire program will end in same place, regardless of result0
    
