class Inventory

  def initialize(items)
    @items = items
  end

  def update_price_new
    @items.each do |item|
      item.update
    end
  end

  def update_price
    @items.each do |item|
      if item.name != "Fine Art" and item.name != "Concert Tickets"
        if item.price > 0
          if item.name != "Gold Coins"
            item.price = item.price - 1

            if item.name == 'Flowers'
              item.price -= 1
            end
          end
        end
      else
        if item.price < 50
          item.price = item.price + 1
          if item.name == "Concert Tickets"
            if item.sell_by < 11
              if item.price < 50
                item.price = item.price + 1
              end
            end
            if item.sell_by < 6
              if item.price < 50
                item.price = item.price + 1
              end
            end
          end
        end
      end

      if item.name != "Gold Coins"
        item.sell_by = item.sell_by - 1
      end

      if item.sell_by < 0
        if item.name != "Fine Art"
          if item.name != "Concert Tickets"
            if item.price > 0
              if item.name != "Gold Coins"
                item.price = item.price - 1

                if item.name == 'Flowers'
                  item.price -= 1
                end
              end
            end
          else
            item.price = item.price - item.price # 0
          end
        else
          if item.price < 50
            item.price = item.price + 1
          end
        end
      end

      if item.price < 0
        item.price = 0
      end
    end
  end
end

class Item
  attr_accessor :name, :sell_by, :price

  def initialize(name, sell_by, price)
    @name = name
    @sell_by = sell_by
    @price = price
  end

  def to_s
    "#{@name}, #{@sell_by}, #{@price}"
  end

  def update_sell_by
    @sell_by -= 1 unless @sell_by.nil?
  end
end

class Flowers < Item
  NAME = 'Flowers'

  def initialize(sell_by, price)
    super(NAME, sell_by, price)
  end

  def update_price
    @price -= 2

    if @sell_by < 0
      @price -= 2
    end

    if @price < 0
      @price = 0
    end
  end

  def update
    update_price
  end
end
