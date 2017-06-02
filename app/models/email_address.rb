class EmailAddress < ApplicationRecord
  has_many :from_addresses
  has_many :from_emails, through: :from_addresses, source: :email
  has_many :to_addresses
  has_many :to_emails, through: :to_addresses, source: :email
  has_many :cc_addresses
  has_many :cc_emails, through: :cc_addresses, source: :email
  has_many :bcc_addresses
  has_many :bcc_emails, through: :bcc_addresses, source: :email
end
