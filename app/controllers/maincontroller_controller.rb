require 'mongo'
require 'json'

class MaincontrollerController < ApplicationController
 def getjson
    mongo_uri = 'mongodb://heroku_rgkq33fl:kbi2jctr39ts8gicrrchjuso5s@ds061954.mongolab.com:61954/heroku_rgkq33fl'
    mongo_client = Mongo::Client.new(mongo_uri);     
    db = mongo_client.database
    db.collection_names.each{|name| puts name }
    citydata=db.collection('cities')
    result =  citydata.find({:rowid => params[:i]})
    result.each do |doc|
    #puts doc
    end
    render json: result

end
end