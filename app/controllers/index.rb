get '/' do
  erb :index
end

get '/dashboard' do
  @org_name = "Coinbase"
  @repo_name = "omniauth-coinbase"
  @contributors = Github::Client.new.contributors
  erb :dashboard
end

post '/dashboard' do
  @org_name = params[:organization].downcase
  @repo_name = params[:repo].downcase
  @contributors = Github::Client.new.contributors(@org_name, @repo_name)
  if request.xhr?
    (erb :'_repo_rank', layout: false).to_json
  else
    redirect '/dashboard'
  end
end