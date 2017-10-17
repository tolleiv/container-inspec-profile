title 'container user'


val_container = attribute('container', description: 'The single container id to test')

describe docker_details(val_container) do
  its('user') { should be_non_root }
end
