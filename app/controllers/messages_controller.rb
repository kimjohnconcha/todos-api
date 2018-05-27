class MessagesController < ApplicationController
  skip_before_action :authorize_request


  def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio

    debugger


    # sms = @client.messages.create(
    #   from: Rails.application.secrets.twilio_number,
    #   to: "from_number",
    #   body: "Hello there, thanks for texting me. Your number is #{from_number}."
    # )
    logger.info message_body
  end

  # def send
  #   boot_twilio
  #   sms = @client.messages.create(
  #     from: "+639277177405",
  #     to: "+19093475757",
  #     body: "text message integration"
  #   )
  # end


  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

end
