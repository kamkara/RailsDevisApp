class Quote < ApplicationRecord
  belongs_to :company  
  has_many :line_item_dates, dependent: :destroy

    #validates
    validates :name, presence: true

    #ordered scope
    scope :ordered, -> { order(id: :desc) }

    #realtime broadcasting
    
    #### METHODE 2 ####
   # after_create_commit -> { broadcast_prepend_to "quotes", partial: "quotes/quote", locals: { quote: self }, target: "quotes" }
   
   #### METHODE 2 #### 
   # later : active le activeJob
   #after_create_commit -> { broadcast_prepend_later_to "quotes" }
   #after_update_commit -> { broadcast_replace_later_to "quotes" }
   #after_destroy_commit -> { broadcast_remove_to "quotes" }
   
   #### METHODE 3 ####
   # Those three callbacks are equivalent to the following single line
  broadcasts_to ->(quote) { [quote.company, "quotes"] }, inserts_by: :prepend
end
