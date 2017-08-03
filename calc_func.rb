def calculator (operat,n1,n2)
	if operat == "addition"
		answer = n1 + n2

	elsif operat == "subtraction"
		answer = n1 - n2

	elsif operat == "multiplication"
		answer = n1 * n2

	else
		answer = n1 / n2
	end
	answer.to_s
end