#Repo-Ranker

Repo-Ranker is a simple app built to consume the [Github API](https://developer.github.com/v3/). Just enter the name of a particular Github repository and the name of the owner it belongs to and Repo-Ranker shows you contributors sorted from highest number of contributions to lowest.

##Deployment

Repo-Ranker is deployed to Heroku. Visit the app [here](https://github-repo-ranker.herokuapp.com/)

##Technology

Repo-Ranker was created using [Sinatra](http://www.sinatrarb.com/), a lightweight framework for creating web applications in Ruby. It utilizes the [HTTParty Gem](https://github.com/jnunemaker/httparty) (see code sample below) to make requests to the [Github API](https://developer.github.com/v3/).

Dynamic content is added using [Jquery](https://jquery.com/) and [AJAX](http://api.jquery.com/jquery.ajax/). CSS is courtesy of [Pure](http://purecss.io/)

##Explore

If you would like to explore the code on your local machine, you will need to obtain your own token to access the Github API.  [Here](https://github.com/blog/1509-personal-api-tokens) is one place you can do that. Once you obtain the token, you will need to store it in a secure place where the app can access it. One option for doing that is described [here](https://github.com/bkeepers/dotenv).  Once you have an access token do the following:

Clone the repo from your command line

`https://github.com/alookatommorow/Repo-Ranker.git`

Navigate to the Repo-Ranker folder

Bundle install

`bundle install`

Use shotgun to start the server

`bundle exec shotgun`

Open your browser and navigate to localhost:9393

##Code Sample

Here is the code enabling requests to the Github API:

`module Github
  class Client
    include HTTParty
    base_uri "https://api.github.com"

    def contributors(org_name="coinbase", repo_name="omniauth-coinbase")
      self.class.get("/repos/#{org_name}/#{repo_name}/contributors", headers: headers, query: { access_token: token})
    end

    def user_agent
      "Repo-Ranker"
    end

    def token
      ENV['GITHUB_TOKEN']
    end


    def headers
      {"User-Agent" => user_agent} #Github requires a user-agent header to make requests
    end

  end

end`

Then in the controller:

`@contributors = Github::Client.new.contributors(@org_name, @repo_name)`