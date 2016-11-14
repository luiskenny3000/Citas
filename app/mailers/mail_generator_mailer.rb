class MailGeneratorMailer < ApplicationMailer

  default from: "Reservaciones <reservaciones.salas@gmail.com>"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_generator_mailer.notify_creation.subject
  #
  def notify_creation(teachers, reservations)
    @teachers =teachers
    @reservations = reservations

    mail to: teachers.email, subject: 'BIENVENIDO'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_generator_mailer.notify_approval.subject
  #
  def notify_approval(teachers, reservations)
    @teachers =teachers
    @reservations = reservations

    mail to: teachers.email, subject: 'APROBACION DE RESERVACION'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_generator_mailer.notify_cancell_by_admin.subject
  #
  def notify_cancell_by_admin(teachers, reservations)
    @teachers =teachers
    @reservations = reservations

    mail to: teachers.email, subject: 'CANCELACION DE RESERVACION'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_generator_mailer.notify_cancell.subject
  #
  def notify_cancell(teachers, reservations)
    @teachers =teachers
    @reservations = reservations

    mail to: teachers.email, subject: 'CANCELACION DE RESERVACION'
  end
end
