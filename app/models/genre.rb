class Genre < ActiveRecord::Base
  # add association
  has_many :songs
end
