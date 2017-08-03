require 'sinatra'
require_relative 'credentials_array.rb'
require_relative 'calc_func.rb'
require_relative 'operator.rb'

get '/' do
	erb :credentials
end

post 'credentials' do
	user_name = params[:user_name]
	password = params [:password]

	if working_credentials(user_name,password) == true
		redirect '/correct?user_name=' + user_name + '&password=' + password

	elsif working_credentials(user_name,password) == false
		redirect '/wrong?user_name=' + user_name + '&password=' + password

	else
		redirect '/error?user_name=' + user_name + '&password=' + password
	end
end

get '/correct' do
	user_name = params[:user_name]
	password = params[:password]
	erb :correct, :locals=> {:user_name=>user_name, :password=>password}
end

post '/correct' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]

	redirect '/age?user_name=' + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name
end

get '/wrong' do
	user_name = params[:user_name]
	password = params[:password]
	erb :wrong, :locals=> {:user_name=>user_name, :password=>password}
end

post '/wrong' do
	user_name = params[:user_name]
	password = params[:password]

	redirect '/credentials'
end

get '/credentials' do
	erb :credentials
end

post '/credentials' do
	user_name = params[:user_name]
	password = params[:password]

	if working_credentials(user_name,password) == true
		redirect '/correct?user_name=' + user_name + '&password=' + password

	elsif working_credentials(user_name,password) == false
		redirect '/wrong?user_name=' + user_name + '&password=' + password

	else
		redirect '/error?user_name=' + user_name + '&password=' + password
	end
end

get'/age' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	erb :age, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name}
end

post '/age' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]

	redirect '/hair_color?user_name=' + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name + '&age=' + age
end

get '/hair_color' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]

	erb :hair_color, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name, :age=>age}
end

post '/hair_color' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]

	redirect '/eye_color?user_name='  + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name + '&age=' + age + '&hair_color=' + hair_color
end

get '/eye_color' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]

	erb :eye_color, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name, :age=>age, :hair_color=>hair_color}
end

post '/eye_color' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]

	redirect '/radio_buttons?user_name=' + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name + '&age=' + age + '&hair_color=' + hair_color + '&eye_color=' + eye_color
end

get '/radio_buttons' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]

	erb :radio_buttons, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name, :age=>age, :hair_color=>hair_color, :eye_color=>eye_color}
end

post '/radio_buttons' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]
	radio_buttons = params[:radio_buttons]

	redirect '/numbers?user_name=' + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name + '&age=' + age + '&hair_color=' + hair_color + '&eye_color=' + eye_color + '&radio_buttons=' + radio_buttons
end

get '/numbers' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]
	radio_buttons = params[:radio_buttons]

	erb :numbers, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name, :age=>age, :hair_color=>hair_color, :eye_color=>eye_color, :radio_buttons=>radio_buttons}
end

post '/numbers' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]
	radio_buttons = params[:radio_buttons]
	num1 = params[:num1]
	num2 = params[:num2]
	calculation = calculator("#{radio_buttons}",num1.to_f,num2.to_f)
	operator = operation_sign("#{radio_buttons}")

	redirect '/answer_page?user_name=' + user_name + '&password=' + password + '&first_name=' + first_name + '&last_name=' + last_name + '&age=' + age + '&hair_color=' + hair_color + '&eye_color=' + eye_color + '&radio_buttons=' + radio_buttons + '&num1=' + num1 + '&num2=' + num2 + '&calculation=' + calculation + '&operator=' + operator
end

get '/answer_page' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]
	radio_buttons = params[:radio_buttons]
	num1 = params[:num1]
	num2 = params[:num2]
	calculation = params[:calculation]
	operator = params[:operator]

	erb :answer_page, :locals=> {:user_name=>user_name, :password=>password, :first_name=>first_name, :last_name=>last_name, :age=>age, :hair_color=>hair_color, :eye_color=>eye_color, :radio_buttons=>radio_buttons, :num1=>num1, :num2=>num2, :calculation=>calculation, :operator=>operator}
end

post '/answer_page' do
	user_name = params[:user_name]
	password = params[:password]
	first_name = params[:first_name]
	last_name = params[:last_name]
	age = params[:age]
	hair_color = params[:hair_color]
	eye_color = params[:eye_color]
	radio_buttons = params[:radio_buttons]
	num1 = params[:num1]
	num2 = params[:num2]
	calculation = params[:calculation]
	operator = params[:operator]
end