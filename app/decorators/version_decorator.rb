class VersionDecorator < ApplicationDecorator
  decorates :version

  def name_with_prefix
    "v#{model.name}"
  end

end