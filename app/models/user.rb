class User < ApplicationRecord
  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?\d)(?=.*?[\W_])[!-~]{8,}+\z/
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, format: { with: VALID_PASSWORD_REGEX, message: "は8文字以上アルファベットの大文字小文字、数字、記号を含んだパスワードを入力してください" }
  validates :password_confirmation, presence: true
  validates :user_img, presence: true
end
