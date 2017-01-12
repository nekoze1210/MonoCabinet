class SearchRakutenItemService
  def initialize(name)
    @item_name = name
  end

  def find_thumbnail
    RakutenWebService::Ichiba::Item.search(keyword: @item_name).first['mediumImageUrls'][0]['imageUrl']
  end
end
