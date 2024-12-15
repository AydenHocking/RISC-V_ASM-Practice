main:
    # Initialize two registers (t0,t1) with predefined values
    addi t0, x0, 2          	# Add value in t0, to value in x0
    addi t1, x0, 8          	# Add value in t1, to value in x0

    # Check t0 == t1
    beq t0, t1, equal		# If t0 == t1, jump to equal 
    # Check t0 != t1
    bne t0, t1, notequal	# If t0 != t1, jump to notequal

# If t0 == t1
equal:
    addi t2, x0, 0             	# Add 0 in t2, to value in x0 (Make sure its zero before next part)
    addi t0, t0, 4     		# t0 = t0 + 4 (Add 4)
    add t2, t0, x0              # t3 = t1 + 0 (Add t0 to t2)
    j end              		# Jump to end

# If t0 is not equal to t1, subtract 4 from t1, copy to t3, jump to end
notequal:
    addi t3, x0, 0             	# Add 0 in t3, to value in x0 (Make sure its zero before next part)
    addi t1, t1, -4    		# t1 = t1 - 4 (Subtract 4)
    add t3, t1, x0              # t3 = t1 + 0 (Add t1 to t3)
    j end			# Jump to end
    
# Ends program 
end:
				# Entire program will end in same place, regardless of result0
                   
