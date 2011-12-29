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

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# vim: ts=2 sw=2
