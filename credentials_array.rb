def working_credentials(uname,pword)
	creds = { "cowboykatie" => "elizabeth2", "syntaxsteven" => "henry8", "testdrivenderrick" => "george3" }

	creds = [["cowboykatie", "elizabeth2"],["syntaxsteven", "henry8"],["testdrivenderrick", "george3"]]
	pair = ["#{uname}","#{pword}"]

	creds.include?(pair)
end