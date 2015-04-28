class Application < ActiveRecord::Base
  belongs_to :posting
  belongs_to :student
end
