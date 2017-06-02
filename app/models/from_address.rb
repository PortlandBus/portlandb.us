class FromAddress < ApplicationRecord
  belongs_to :email
  belongs_to :email_address
end
