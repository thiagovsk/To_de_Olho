module Devise
 module Strategies
  class Password < Base
	def valid?
		params['login'] || params['password']

	end


	def authenticate!
		u = Usuario.authenticate(params['login'],params['password'])
		u = nil? ?fail!("Não foi possivel Logar") : success!(u)
	end
  end
 end
end

