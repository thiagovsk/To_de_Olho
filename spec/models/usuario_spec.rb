require 'spec_helper'

require 'spec_helper'

describe Usuario do
  it "Pode ser instanciado" do
    Usuario.new.should be_an_instance_of(Usuario)
  end


  it { should validate_presence_of(:login)}
  it { should validate_uniqueness_of(:login)}

end
