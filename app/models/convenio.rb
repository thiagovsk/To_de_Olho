class Convenio < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file.path, headers: true, encoding: "iso-8859-1:UTF-8") do |row|
      Convenio.create! row.to_hash
    end
  end

  def self.search(query)
    where("uf like ?", "%#{query}%")
  end

end
