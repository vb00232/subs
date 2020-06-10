class ApplicationMailer < ActionMailer::Base
  default to: "surreysubs@surrey.ac.uk", from: "username@surrey.ac.uk"
  layout 'mailer'
end
