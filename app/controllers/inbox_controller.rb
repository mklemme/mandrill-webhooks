class InboxController < ApplicationController
  include Mandrill::Rails::WebHookProcessor

  def handle_inbound(event_payload)
    sender = event_payload['msg']['from_email']
    message = event_payload['msg']['html']
    binding.pry
    Item.save_inbound_mail(event_payload)
  end

end
