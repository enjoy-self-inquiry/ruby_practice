#スーパークラスのProductクラスの定義（ちなみにProductクラスのスーパークラスは、Objectクラス）
#ProductクラスとDVDクラスに属性を追加する。
#Productクラスは、商品名(name)と価格(price)という属性を保持する。
class Product
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end
end
product = Product.new('A great movie', 1000)
product.name #=> "A great movie"
product.price #=> 1000

#サブクラスのDVDクラスはProductクラスを継承する
class DVD < Product
  #nameとpriceはスーパークラスでattr_readerが設定されているので定義不要
  attr_reader :running_time #再生時間

  def initialize(name, price, running_time)
    #スーパークラスのinitializeメソッドの呼出し
    super(name,price)
    #DVDクラス独自の属性
    @running_time =running_time
  end
end
dvd = DVD.new('A great movie', 1000, 120)
dvd.name #=> 'A great movie'
dvd.price #=> 1000
dvd.running_time #=> 120

#スーパークラスとサブクラスで実行する処理が変わらなければ、サブクラスで同名メソッドを定義する必要はない。
class Bluray < Product
end
bluray = Bluray.new('A good movie', 500)
bluray.name #=> 'A good movie'
bluray.price #=> 500
