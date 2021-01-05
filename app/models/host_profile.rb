class HostProfile < ApplicationRecord
  belongs_to :host

  VALID_NAME_REGEX= /\A[一-龥ぁ-ん]/
  VALID_NAME_KANA_REGEX= /\A[ァ-ヶー－]+\z/
  
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }

  validates :birthday, presence: true
  validates :phone_number, presence: true

  validates :sex, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end
  
  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
