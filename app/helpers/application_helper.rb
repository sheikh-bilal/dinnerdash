module ApplicationHelper
  def findCategory(item)
    Category.find(item.category_id).name
  end
end
