class Convenio < ActiveRecord::Base

	def self.import(file)
		CSV.foreach(file.path, headers: true, encoding: "UTF-8") do |row|
			Convenio.create! row.to_hash
		end
	end
end
