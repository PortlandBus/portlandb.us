class CcAddress < ApplicationRecord
  belongs_to :email
  belongs_to :email_address
end
