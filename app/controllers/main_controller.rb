class MainController < ApplicationController

  require 'rubygems'
  require 'twilio-ruby'

  def index
    @videos = Video.all
  end
  
  def send_sms
    @account_sid = 'AC8652de94df71913aa4eeb7e1afd87680'
    @auth_token = "1eb2f22a32cef348c4fdcd8eb4403165"

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @to_number = params[:to_number]
    @message = params[:message]
    @account = @client.account
    @response = @account.sms.messages.create({:to => '+16506463891', :from => '+16504927047', :body => @message}) 
    SmsLog.create(:to_number => @to_number, :message => @message, :sid => @response.sid, :status => @response.status)
  end
end