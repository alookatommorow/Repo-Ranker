get '/' do
  erb :index
end

get '/dashboard' do
  @org_name = "Coinbase"
  @repo_name = "omniauth-coinbase"
  @contributors = Github::Client.new.contributors
  erb :dashboard
end