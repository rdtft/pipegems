class PipegemDecorator < ApplicationDecorator
  decorates :pipegem

  def name_with_prefix
    "pipe-#{pipegem.name}"
  end

end
