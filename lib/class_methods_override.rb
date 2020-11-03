class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  #Prodcutクラスで、to_sメソッドをオーバーライド（上書き）する。
  def to_s
    "name: #{name}, price: #{price}"
  end
end

class DVD < Product
  attr_reader :running_time

  def initialize(name, price, running_time)
    super(name, price)
    @running_time = running_time
  end

  #DVDクラスで、さらにto_sメソッドをオーバーライド。superを使ってスーパークラス（Prodcutクラス)のメソッドを活用
  def to_s
    "#{super}, running_time: #{running_time}"
  end

end

product = Product.new('A great movie', 1000)
#to_sメソッドは、Objectクラスで定義されているので、すべてのオブジェクトでto_sメソッドを呼び出せる。
product.to_s　#=>"name: A great movie, price: 1000"
#=> "※デフォルトは#<Product:0x007fe4e42e9f20>というように、オブジェクトの内容を文字列に変換して返す

dvd = DVD.new('An awesome film', 3000, 120)
dvd.to_s #=>"name: An awesome film, price: 3000 running_time: 120"
