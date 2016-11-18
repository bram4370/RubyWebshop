require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  test "received" do
    mail = OrderMailer.received(orders(:one))
    assert_equal "7 facts you will never believe! 3 will shock you", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Rick@roll.com"], mail.from
    assert_match /1 x samsung galaxy s6/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderMailer.shipped(orders(:one))
    assert_equal "8 facts you will never believe! Doctors hate it!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["Rick@roll.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>samsung galaxy s6<\/td>/, mail.body.encoded
  end
end
