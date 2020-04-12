class Floor < ApplicationRecord
  belongs_to :admin
  has_many :rooms

  validates :admin_id, presence: true

  rails_admin do
    list do 
      field :id
      field :building_id do
        label 'Building'
        formatted_value do 
          Building.find(value).name
        end 
      end 
      field :floor_num 
      field :total_room
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
      field :building_id do
        label 'Building'
        formatted_value do 
          Building.find(value).name
        end 
      end 
      field :floor_num 
      field :total_room
      field :admin_id do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end 
      field :created_at
    end

    edit do
      field :building_id, :enum do
        required true
        label 'Building'
        enum do
          Building.all.collect{|b| [b.name, b.id]}
        end
      end  
      field :floor_num, :integer do
        required true
      end
      field :total_room, :integer do
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
      field :building_id, :enum do
        required true
        label 'Building'
        enum do
          Building.all.collect{|b| [b.name, b.id]}
        end
      end  
      field :floor_num, :integer do
        required true
      end
      field :total_room, :integer do
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