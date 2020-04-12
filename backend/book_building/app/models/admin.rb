class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable, :trackable
  
  has_many :buildings, dependent: :destroy
  has_many :floors, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :fee_units, dependent: :destroy
  has_many :rental_fees, dependent: :destroy
  has_many :management_fees, dependent: :destroy

  validates :name, :email, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\d+\z/}, :length => { :minimum => 10, :maximum => 12 }

  after_initialize do
    self.confirmed_at = DateTime.now
  end

  rails_admin do
    list do
      field :id
      field :name
      field :email
      field :phone
      field :created_at
    end 

    show do
      field :id
      field :name
      field :email
      field :phone
      field :created_at
    end 

    edit do
      field :name, :string do
        required true
      end
      field :email, :string do
        required true
      end
      field :phone, :string do
        required true
      end
      field :password, :string do
        required true
      end
    end
  end 
end
