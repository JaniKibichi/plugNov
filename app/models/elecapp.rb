class Elecapp < ActiveRecord::Base
 validates_presence_of :from, :to, :text, :date, :linkId
 

end
