class Ownership < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :item, class_name: "Item"
  
  def self.top10
    top(10)
  end

  def self.top(limit)
    hash = limit(limit).group(:item_id).order('count_item_id desc').count(:item_id)
    # {item_id: count, item_id: count, item_id: count,...}　順番通り
    item_ids = hash.keys
    # [item_id, item_id, item_id......] 順番通り
    items = Item.find(item_ids)
    # {#<Item>, #<Item>, ....] id順
    items = items.sort_by{|item| item_ids.index(item.id) }
   
  end
end
