
require 'docker'

class DockerDetails < Inspec.resource(1)
  name 'docker_details'

  desc "
    A resource to retrieve information about docker
  "

  def initialize(id)
  @id = id
  end
  def method_missing(name)
    @params[name]
  end

  def user
    output = Docker::Container.get(@id).json
    output['Config']['User']
  end
end
