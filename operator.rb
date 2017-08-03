def operation_sign(operate)
	if operate.to_s == "addition"
		result = "+"

	elsif operate.to_s == "subtraction"
		result = "-"

	elsif operate.to_s == "multiplication"
		result = "x"

	elsif operate.to_s == "division"
		result = "/"
	end

	result
end

p operation_sign("addition")