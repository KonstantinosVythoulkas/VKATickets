class EmployeeroomChannel < ApplicationCable::Channel
  def subscribed
     stream_from "employeeroom_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
