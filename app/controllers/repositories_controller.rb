class RepositoriesController < ApplicationController
  def index
  resp = Faraday.get("https://github.com/user/repos") do |req|

    req.params['authorization'] = "token #{session[:token]}"
          req.params['accept'] = 'application/json'

  end
  @repos = JSON.parse(resp.body)
end

  def create
    resp = Faraday.post("https://github.com/user/repos") do |req|

      req.params['authorization'] = "token #{session[:token]}"
            req.params['accept'] = 'application/json'
            req.params['name'] = 'params[:name].to_json'
          end

    redirect_to '/'
  end
