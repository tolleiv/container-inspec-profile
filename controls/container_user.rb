title 'container user'

describe docker_details(ENV['CONTAINER']) do
  its('user') { should be_non_root }
end
