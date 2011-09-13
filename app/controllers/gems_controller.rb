class GemsController < ApplicationController
  def index; end

  def show
    name, version = params[:id].match(/^pipe-(.+)-(.+)\.gem$/).captures
    gem_file = Rubygem          \
      .find_by_name(name)       \
      .rubygem_versions         \
      .find_by_version(version) \
      .gem_file

    redirect_to gem_file.file.url
  end
end
