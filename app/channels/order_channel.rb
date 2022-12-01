class OrderChannel < ApplicationCable::Channel
  def subscribed
    puts "data receieved in the chaanel"
    stream_from "order_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
