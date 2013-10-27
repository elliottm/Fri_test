require 'twilio-ruby'

module Text

  def send_message body, customer

    account_sid = 'AC2a1e60fa3032eb15e951d00656ceccd6'
    auth_token = 'c9507e15ae94e5a53b6f60f7200ecea7'


    @client = Twilio::REST::Client.new account_sid, auth_token


    @client.account.sms.messages.create(
      :from => '+441455561022',
      :to => customer.phone,
      :body => customer_message 
      )

  end

end