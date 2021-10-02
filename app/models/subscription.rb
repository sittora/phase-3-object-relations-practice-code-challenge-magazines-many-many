class Subscription < ActiveRecord::Base
    belongs_to :magazine
    belongs_to :reader
  

    # Subscription#print_details
    #     puts a string to the terminal to display the details of the subscription
    #     the string should be formatted like this: {reader name} subscribed to {magazine title} for ${subscription price}

    def print_details
         "#{reader.name} subscribed to #{magazine.title} for #{self.price}"
    end

    







end