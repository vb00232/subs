# Preview all emails at http://localhost:3000/rails/mailers/contact_us_mailer
class ContactUsMailerPreview < ActionMailer::Preview
  def contact_email
    ContactUsMailer.contact_email("tim00095@surrey.ac.uk", "Tim Holl", 
      "07506972342", @message = "I believe I have been scammed")
  end
end
