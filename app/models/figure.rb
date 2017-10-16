class Figure < ActiveRecord::Base
  #landmarks will need foreign key
  has_many :landmarks
  has_many :figure_titles
  has_many :titles, through: :figure_titles
end
