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
    # content_type :json
    # p contributors
    # {hello: "shit"}.to_json
    # erb :'_repo_rank', layout:false, locals:{org_name: org_name, repo_name: repo_name, contributors: contributors}
    (erb :'_repo_rank', layout: false).to_json
  else
    redirect '/dashboard'
  end
end