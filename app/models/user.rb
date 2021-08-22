class User < ApplicationRecord
    # Userインスタンスを保存する前にemailの文字列を小文字へ変換
    before_save {self.email.downcase! }
    
  #バリデーション
    # name
    validates :name, presence: true, length: { maximum: 50 }
    
    # shop
    validates :shop, presence: true, length: { maximum: 100 }
    
    # email
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    
    # password_digestセキュリティ用コード
    has_secure_password
    
    # Menuとの一対多関係を構築
    has_many :menus
end
