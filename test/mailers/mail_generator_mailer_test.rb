require 'test_helper'

class MailGeneratorMailerTest < ActionMailer::TestCase
  test "notify_creation" do
    mail = MailGeneratorMailer.notify_creation
    assert_equal "Notify creation", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_approval" do
    mail = MailGeneratorMailer.notify_approval
    assert_equal "Notify approval", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_cancell_by_admin" do
    mail = MailGeneratorMailer.notify_cancell_by_admin
    assert_equal "Notify cancell by admin", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "notify_cancell" do
    mail = MailGeneratorMailer.notify_cancell
    assert_equal "Notify cancell", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
