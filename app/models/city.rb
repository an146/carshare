# == Schema Information
#
# Table name: cities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  lat        :float
#  lon        :float
#  created_at :datetime
#
# Indexes
#
#  index_cities_on_name  (name) UNIQUE
#

class City < ActiveRecord::Base
end
