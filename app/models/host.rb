class Host < ApplicationRecord
  has_many :hosts_status_histories, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true
  validate  :correct_url

  def available?
    hosts_status_histories.open.first.present? ? false : true
  end

  def correct_url
    if (url =~ /\A#{URI::regexp(['http', 'https'])}\z/).nil?
      errors.add(:url, 'Incorrect url format')
    end
  end
end
