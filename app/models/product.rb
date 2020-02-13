class Product < ApplicationRecord
  mount_uploader :data, DataUploader
end
