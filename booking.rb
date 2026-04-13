require_relative "errors"

class Booking
  attr_reader :user, :resource, :status, :created_at

  def initialize(user:, resource:)
    @user = user
    @resource = resource
    @created_at = Time.now

    if !resource.available?
      raise BookingError, "Resource already booked"
    end

    @status = "active"
    resource.assign_booking(self)
  end

  def cancel
    if @status == "cancelled"
      raise BookingError, "Booking already cancelled"
    end

    @status = "cancelled"
    @resource.clear_booking
  end
end