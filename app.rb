require_relative "user"
require_relative "resource"
require_relative "booking"

user1 = User.new(id: 1, name: "Roben", role: "student")
user2 = User.new(id: 2, name: "john", role: "assistant")

res1 = Resource.new(id: 1, name: "Microscope", category: "lab")
res2 = Resource.new(id: 2, name: "Projector", category: "classroom")

# 1. valid booking
booking1 = Booking.new(user: user1, resource: res1)
puts "Booking created: #{booking1.status}"

# 2. conflicting booking (should fail)
begin
  Booking.new(user: user2, resource: res1)
rescue BookingError => e
  puts "Blocked: #{e.message}"
end

# 3. cancel booking
booking1.cancel
puts "Cancelled booking"

# 4. now booking should work again
booking2 = Booking.new(user: user2, resource: res1)
puts "New booking created after cancellation"