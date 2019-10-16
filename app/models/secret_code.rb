class SecretCode < ApplicationRecord
  belongs_to :user, optional: true

  attr_accessor :token_count

  before_save :create_random_toke
  scope :free_codes, -> { where(user_id: nil) }
  scope :used_codes, -> { where.not(user_id: nil) }

  def create_random_toke
    self.token = SecureRandom.hex(6)
  end

end
