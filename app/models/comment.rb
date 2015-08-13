class Comment < ActiveRecord::Base
  belongs_to :trick
  belongs_to :user
end
