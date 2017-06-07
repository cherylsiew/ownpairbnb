class Booking < ApplicationRecord
	belongs_to :user
	belongs_to :listing

  validate :overlap?

  def overlap?
    if self.listing.bookings.where("(start_date BETWEEN ? AND ?) OR (end_date BETWEEN ? AND ?)", self.start_date, self.end_date, self.start_date, self.end_date).count > 0
      errors.add(:start_date, "is not available")
    end
  end

# def overlap?(x,y)
#   (x.first - y.end) * (y.first - x.end) > 0
# end

end