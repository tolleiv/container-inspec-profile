title 'container user'
val_container = attribute('container', description: 'The single container id to test')
val_layer_threshold = attribute('layer_threshold', default:  10,  description: 'The threshold of maximum image layers')

control 'container_user' do
  impact 0.6
  title 'Container User'
  desc '
   Containers should not run as root.
  '

  describe docker_details(val_container) do
    its('user') { should be_non_root }
  end
end

control 'container_layer_count' do
  impact 0.3
  title 'Container Layer Count'
  desc '
   Containers should have a small layer count
  '
  describe docker_details(val_container) do
    its('layer_count') { should be < val_layer_threshold }
  end
end

