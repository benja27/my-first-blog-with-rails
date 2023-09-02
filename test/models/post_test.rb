# == Schema Information
#
# Table name: posts
#
#  id               :bigint           not null, primary key
#  title            :string
#  text             :text
#  author_id        :bigint           not null
#  comments_counter :integer          default(0)
#  likes_counter    :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
