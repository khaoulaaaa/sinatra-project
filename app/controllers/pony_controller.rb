post '/sendemail' do 	
	unless Pony.mail(:to => 'khaoula.mohamed@ensi-uma.tn', :from => 'mohamedkhaoula2@gmail.com', :subject => 'hi', :body => 'Hello there.')
	redirect '/'
	end
end