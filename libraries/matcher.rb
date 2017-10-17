require 'json'

RSpec::Matchers.define :be_non_root do
  match do |output|
    output != '' && output != 'root'
  end
end
