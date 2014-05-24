FactoryGirl.define do 

	factory :admin, :class => Usuario do
		nome "Fiiiii"
		cpf "037136670141"
		email "fiii@gmail.com"
		login "abcdfffe"
		password "12345678"
		password_confirmation "12345678"
		after(:create) {|usuario| usuario.add_role(:admin)}
	end

	factory :default, :class => Usuario do
		nome "André"
		cpf "03713770123"
		email "asdw@gmail.com"
		login "abcdeweukj"
		password "12345678"
		password_confirmation "12345678"
	end

end