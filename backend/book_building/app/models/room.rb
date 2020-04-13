class Room < ApplicationRecord
  belongs_to :admin
  has_many_attached :images

  has_many :floors
  has_one :rental_fee
  has_one :management_fee

  validates :rental_fee_id, :management_fee_id, :acreage, :room_num, presence: true  

  attr_accessor :remove_images
  after_save do
    Array(remove_images).each { |id| images.find_by_id(id)&.try(:purge) }
  end
  
  rails_admin do
    list do 
      field :id
      field :floor_id do
        label 'Floor'
        formatted_value do 
          Floor.find(value).floor_num
        end 
      end 
      field :room_num
      field :status
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
      field :floor_id do
        label 'Floor'
        formatted_value do 
          Floor.find(value).floor_num
        end 
      end 
      field :room_num
      field :acreage do
        formatted_value do 
          (value.to_s + " " + "m²")
        end 
      end 
      field :rental_fee_id do
        label 'Rental Fee'
        formatted_value do 
          "#{RentalFee.find(value).price} #{FeeUnit.find(RentalFee.find(value).fee_unit_id).name}"
        end 
      end
      field :management_fee_id do
        label 'Management Fee'
        formatted_value do 
          "#{ManagementFee.find(value).price} #{FeeUnit.find(ManagementFee.find(value).fee_unit_id).name}"
        end 
      end
      field :status
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
      field :floor_id, :enum do
        required true
        label 'Floor'
        enum do
          Floor.all.collect{|f| [f.floor_num, f.id]}
        end
      end  
      field :room_num, :integer do
        required true
      end
      field :acreage
      field :status
      field :rental_fee_id, :enum do
        required true
        label 'Rental Fee'
        enum do
          RentalFee.all.collect{|r| ["#{r.price} #{FeeUnit.find(r.fee_unit_id).name}", r.id]}
        end
      end
      field :management_fee_id, :enum do
        required true
        label 'Management Fee'
        enum do
          ManagementFee.all.collect{|m| ["#{m.price} #{FeeUnit.find(m.fee_unit_id).name}", m.id]}
        end
      end
      field :images, :multiple_active_storage do
        delete_method :remove_images
      end
      field :admin_id, :hidden do
        default_value do
          bindings[:view].current_admin.id
        end
      end
    end

    create do
      field :floor_id, :enum do
        required true
        label 'Floor'
        enum do
          Floor.all.collect{|f| [f.floor_num, f.id]}
        end
      end  
      field :room_num, :integer do
        required true
      end
      field :acreage
      field :status
      field :rental_fee_id, :enum do
        required true
        label 'Rental Fee'
        enum do
          RentalFee.all.collect{|r| ["#{r.price} #{FeeUnit.find(r.fee_unit_id).name}", r.id]}
        end
      end
      field :management_fee_id, :enum do
        required true
        label 'Management Fee'
        enum do
          ManagementFee.all.collect{|m| ["#{m.price} #{FeeUnit.find(m.fee_unit_id).name}", m.id]}
        end
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