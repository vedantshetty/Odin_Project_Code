require 'test_helper'
class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(username: 'Vedant', email: 'vshetty.vs@gmail.com',
                     password_digest: 'blahblah@',
                     password_confirmation: 'blahblah@')
  end

  test 'username should be 1 word' do
    @user.username = 'Vedant Shetty'
    assert_not @user.valid?
  end

  test 'username should be present' do
    @user.username = ''
    assert_not @user.valid?
  end

  test 'username should not be too long' do
    @user.username = 'a'*26
    assert_not @user.valid?
  end

  test 'username should not have any special characters' do
    @user.username = '$vedant'
    assert_not @user.valid?
  end

  test 'username should be unique' do
    usr = @user.dup
    usr.save
    assert_not @user.valid?
  end

  test 'email should exist' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'should accept valid emails' do
    valid_emails = %w[vshetty.vs@gmail.com vedant_shetty@sitpune.edu.in blah@foo.com]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, " #{valid_email} should be valid"
    end
  end


  test 'should reject invalid emails' do
    invalid_emails = %w[plainaddress
                        #@%^%#$@#$@#.com
                        @example.com
                        'Joe Smith <email@example.com>'
                        email.example.com
                        email@example@example.com
                        .email@example.com
                        あいうえお@example.com
                        'email@example.com (Joe Smith)'
                        email@example
                        email@-example.com
                        email@111.222.333.44444 ]
		invalid_emails.each do |invalid_email|
			@user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email} should be invalid"
  	end
  end
  
  test 'password must be at least 8 characters long' do
  	@user.password_digest = @user.password_confirmation = 'a$'
  	assert_not @user.valid?
  end
  
  test 'password must contain at least 1 special character' do
  	@user.password_digest= @user.password_confirmation = 'blahblahblacksheep'
  	assert_not @user.valid?
  end
  
  test 'password must be present' do 
  	@user.password_digest = ''
  	assert_not @user.valid?
  end
end
