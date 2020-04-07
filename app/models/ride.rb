class Ride < ActiveRecord::Base
    belongs_to :user 
    belongs_to :attraction

    attr_accessor :flash_notice

    def create 

    end 

    def take_ride 
        if self.attraction.tickets > self.user.tickets && self.attraction.min_height > self.user.height
            self.flash_notice = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        elsif self.attraction.tickets > self.user.tickets
            self.flash_notice = "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif
            self.attraction.min_height > self.user.height 
            self.flash_notice = "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            self.flash_notice = "Thanks for riding the #{self.attraction.name}!"
        end
    end
end
