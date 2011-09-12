class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    sign_in_and_redirect \
      User.find_or_create_by_oauth( env['omniauth.auth'] ),
      event: :authentication
  end

  def passthru
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
