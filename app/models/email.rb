class Email < ApplicationRecord

  @address_fields = %w( from to cc bcc)

  @address_fields.each do |field|
    has_many (field + "_addresses").to_sym
    has_many field.to_sym, through: (field + "_addresses").to_sym, source: :email_address
  end

  #FIXME validate uniqueness on each addresses field

  def self.receive_mail(message)
     message_text = message.multipart? ? (message.text_part ? message.text_part.body.decoded : nil) : message.body.decoded 
    email = self.new(
      subject: message.subject,
      date: message.date,
      message_id: message.message_id,
      text_body: message_text,
      html_body: message.html_part,
      raw: message
    )
    @address_fields.each do |field|
      if message[field].present?
        message[field].each do |address|
          email_address = EmailAddress.find_or_create_by(email: address.address)
          email_address.name ||= address.display_name
          email_address.save
          email.send(field.to_sym) << email_address
        end
      end
    end
    email.save
  end
end
