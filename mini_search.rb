require 'sinatra'
require 'sinatra/activerecord'
require 'scoped_search'
require 'json'
require 'model/subscription'
require 'model/organization'
require 'config/settings.rb'

module MiniSearch
   get '/candlepin/pools' do
    res = Subscription.my_subscription("#{params[:owner]}").search_for("#{params[:search]}")
    content_type :json
    res.to_json
  end

  get '/candlepin/pools/auto_complete_search' do
    res = Subscription.complete_for("#{params[:search]}") 
    content_type :json
    res.to_json
  end

end


