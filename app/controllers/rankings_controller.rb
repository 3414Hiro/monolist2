class RankingsController < ApplicationController
  def have
    @items = Have.top10
  end
  
  def want
    @items = Want.top10
    # [{item: #<Item>, count: 1}....]
  end
end
