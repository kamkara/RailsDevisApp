class Quote < ApplicationRecord
    
    #validates
    validates :name, presence: true

    #ordered scope
    scope :ordered, -> { order(id: :desc) }

    #realtime broadcasting
    
    #### METHODE 2 ####
   # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
   
   #### METHODE 2 ####
   after_create_commit -> { broadcast_prepend_to "quotes" }
   after_update_commit -> { broadcast_replace_to "quotes" }
   after_destroy_commit -> { broadcast_remove_to "quotes" }
end
