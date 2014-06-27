# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

#Formatando data para apresentação no formato brasileiro
Time::DATE_FORMATS[:abaixo_assinado] = "%m de %b de %Y"
