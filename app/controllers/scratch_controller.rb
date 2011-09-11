class ScratchController < ApplicationController

  require 'rubygems'
  require 'twilio-ruby'

  def sms    
    @account_sid = 'AC8652de94df71913aa4eeb7e1afd87680'
    @auth_token = "1eb2f22a32cef348c4fdcd8eb4403165"

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)


    @account = @client.account
    @message = @account.sms.messages.create({:to => '+16506463891', :from => '+16504927047', :body => "hello"})
    render :text => "sent message"
  end
  
  def sms_log
    @sms_logs = SmsLog.find(:all)
  end
end