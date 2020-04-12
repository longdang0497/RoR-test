class ManagementFee < ApplicationRecord
  belongs_to :admin
  
  has_one :fee_unit

  validates :price, :fee_unit_id, :admin_id, presence: true

  scope :export_management_fee, -> { price + " " + fee_unit.name}

  rails_admin do
    list do 
      field :id
      field :price
      field :fee_unit_id do
        label 'Unit'
        formatted_value do 
          FeeUnit.find(value).name
        end 
      end
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
      field :price
      field :fee_unit_id do
        label 'Unit'
        formatted_value do 
          FeeUnit.find(value).name
        end 
      end
      field :admin_id do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end 
      field :created_at
    end

    edit do
      field :price do 
        required true 
      end 
      field :fee_unit_id, :enum do
        required true
        label 'Unit'
        enum do
          FeeUnit.all.collect{|f| [f.name, f.id]}
        end
      end
      field :admin_id, :hidden do
        default_value do
          bindings[:view].current_admin.id
        end
      end    
    end
  end
end