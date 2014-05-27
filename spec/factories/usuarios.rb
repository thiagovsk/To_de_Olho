require 'faker'

FactoryGirl.define do

	factory :admin, :class => Usuario do |f|
		f.nome {Faker::Name.name}
		f.cpf "037136670141"
		f.email {Faker::Internet.email}
		f.login {Faker::Internet.user_name}
		f.password "12345678"
		f.password_confirmation "12345678"
		after(:create) {|usuario| usuario.add_role(:admin)}
	end

	factory :default, :class => Usuario do |f|
		f.nome {Faker::Name.name}
		f.cpf "03713770123"
		f.email {Faker::Internet.email}
		f.login {Faker::Internet.user_name}
    f.password "12345678"
    f.password_confirmation "12345678"
	end

end