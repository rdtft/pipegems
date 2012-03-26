class PipegemDecorator < ApplicationDecorator
  decorates :pipegem

  def name_with_prefix
    "pipe-#{model.name}"
  end

end