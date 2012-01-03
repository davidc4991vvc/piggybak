module Piggybak 
  class Address < ActiveRecord::Base
    belongs_to :state

    validates_presence_of :firstname
    validates_presence_of :lastname
    validates_presence_of :address1
    validates_presence_of :city
    validates_presence_of :state_id
    validates_presence_of :zip
      
    def admin_label
      address = "#{self.firstname} #{self.lastname}<br />"
      address += "#{self.address1}<br />"
      if self.address2 && self.address2 != ''
        address += "#{self.address2}<br />"
      end
      address += "#{self.city}, #{self.state.abbr} #{self.zip}"
      address
    end
    alias :display :admin_label  
  end
end
