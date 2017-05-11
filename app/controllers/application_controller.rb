class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
  	render html: "Salut les poto"
  end
end
