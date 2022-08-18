class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead 
        if  self.auditions.size == 0
            "no actor has been hired for this role"
        else  
            self.auditions.first
        end
    end

    def understudy 
        if  self.auditions.size < 2
            "no actor has been hired for this role"
        else  
            self.auditions.second
        end
    end
end