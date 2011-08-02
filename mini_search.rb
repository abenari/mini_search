require 'sinatra'
require 'sinatra/activerecord'
require 'scoped_search'
require 'json'
require 'model/subscription'
require 'model/organization'
require 'config/settings.rb'

module MiniSearch
  get '/candlepin/pools' do
    begin
      res = Subscription.my_subscription("#{params[:owner]}").search_for("#{params[:search]}")
    rescue ScopedSearch::QueryNotSupported => e
      res = Subscription.my_subscription("#{params[:owner]}").all
    end
    content_type :json
    res.to_json
  end


  get '/candlepin/pools/auto_complete_search' do
    begin
      res = Subscription.complete_for("#{params[:search]}")
    rescue ScopedSearch::QueryNotSupported => e
      res = [{:error =>e.to_s}]
    end
    content_type :json
    res.to_json
  end

end


