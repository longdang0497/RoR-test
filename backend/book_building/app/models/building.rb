class Building < ApplicationRecord
  belongs_to :admin
  has_many_attached :images
  has_rich_text :discription

  has_many :floors

  validates :admin_id, :build_year, :city, :district, :floor_number, presence: true  

  attr_accessor :remove_images
  after_save do
    Array(remove_images).each { |id| images.find_by_id(id)&.try(:purge) }
  end

  rails_admin do
    list do 
      field :id
      field :name 
      field :address 
      field :district
      field :city
      field :created_at
    end

    show do 
      field :id
      field :name 
      field :address 
      field :district
      field :city
      field :build_year
      field :floor_number
      field :equipments
      field :admin_id do
        label 'Created by'
        formatted_value do 
          Admin.find(value).name
        end 
      end 
      field :images, :multiple_active_storage
      field :created_at
    end

    edit do
      field :name, :string do
        required true
      end
      field :address
      field :district, :string do
        required true
      end
      field :city, :string do
        required true
      end
      field :build_year
      field :floor_number
      field :equipments
      field :discription do
        js_location { bindings[:view].asset_pack_path 'actiontext.js' }
      end
      field :images, :multiple_active_storage do
        delete_method :remove_images
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
      field :address
      field :district, :string do
        required true
      end
      field :city, :string do
        required true
      end
      field :build_year
      field :floor_number
      field :equipments
      field :discription do
        js_location { bindings[:view].asset_pack_path 'actiontext.js' }
      end
      field :images, :multiple_active_storage
      field :admin_id, :hidden do
        default_value do
          bindings[:view].current_admin.id
        end
      end
    end
  end 
end 