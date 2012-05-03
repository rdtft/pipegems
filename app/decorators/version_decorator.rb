class VersionDecorator < ApplicationDecorator
  decorates :version

  def name_with_prefix
    "v#{version.name}"
  end

end
