class Game < ActiveRecord::Base
  searchkick suggest: [:name]
end
