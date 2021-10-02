class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions
    


    # Reader#subscribe(magazine, price)
    #     takes a magazine (an instance of the Magazine class) and a price (integer) as arguments, and creates a new subscription in the database associated with the magazine and the reader
    def subscribe(magazine, price)
        Subscription.create(price: price, magazine_id: magazine.id, reader_id: self.id)
    end



    # Reader#total_subcription_price
    #     returns the total price for all the reader's subscriptions
    def total_subscription_price
        self.subscriptions.sum { |subscription| subscription.price }
    end
    # Reader#cancel_subscription(magazine)
    #     takes a magazine instance and removes the subscription for this reader
    #     you will have to delete a row from the subscriptions table to get this to work!
    def cancel_subscription(magazine)
        Subscription.find_by(reader_id: self.id, magazine_id: magazine.id).destroy
        self.save
    end

  
end