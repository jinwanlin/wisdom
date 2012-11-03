class Comment < Note
  belongs_to :parent, :class_name => 'Note', :counter_cache => :children_count
  
  # attr_accessible :title, :body
end
