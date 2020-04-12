class FeeUnit < ApplicationRecord
  belongs_to :admin
  belongs_to :rental_fees
  belongs_to :management_fees

  validates :name, :admin_id, presence: true
  validates_uniqueness_of :name

  rails_admin do
    list do 
      field :id
      field :name
      field :admin_id do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end 
      field :created_at
    end

    show do 
      field :id
      field :name 
      field :admin_id do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end 
      field :created_at
    end

    edit do
      field :name, :string do
        required true
      end
      field :admin_id, :string do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end    
    end

    create do
      field :name, :string do
        required true
      end
      field :admin_id, :hidden do
        default_value do
          bindings[:view].current_admin.id
        end
      end
    end
  end 
end