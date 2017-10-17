title 'container user'


val_container = attribute('container', description: 'The single container id to test')
val_layer_threshold = attribute('layer_threshold', default:  10,  description: 'The threshold of maximum image layers')

describe docker_details(val_container) do
  its('user') { should be_non_root }

  its('layer_count') { should be < val_layer_threshold }
end
