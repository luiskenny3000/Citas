# Preview all emails at http://localhost:3000/rails/mailers/mail_generator_mailer
class MailGeneratorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/mail_generator_mailer/notify_creation
  def notify_creation
    MailGeneratorMailer.notify_creation
  end

  # Preview this email at http://localhost:3000/rails/mailers/mail_generator_mailer/notify_approval
  def notify_approval
    MailGeneratorMailer.notify_approval
  end

  # Preview this email at http://localhost:3000/rails/mailers/mail_generator_mailer/notify_cancell_by_admin
  def notify_cancell_by_admin
    MailGeneratorMailer.notify_cancell_by_admin
  end

  # Preview this email at http://localhost:3000/rails/mailers/mail_generator_mailer/notify_cancell
  def notify_cancell
    MailGeneratorMailer.notify_cancell
  end

end
