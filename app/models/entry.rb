class Entry < ApplicationRecord
  belongs_to :user

  validates :name, :username, :password, presence: true
  validate :url_must_be_valid

  encrypts :username, deterministic: true
  encrypts :password

  scope :search_name, ->(name) {
    where("entries.name LIKE ?", "%#{name}%") if name.present?
  }

  def self.search(name)
    search_name(name).order(:name)
  end

  private

  # manual validation
  def url_must_be_valid
    unless url.include?("http" || "https")
      errors.add(:url, "must be valid")
    end
  end
end
