#クラスインスタンス変数・・・インスタンスの作成とは無関係に、クラス自身が保持しているデータ。
#インスタンス変数とは異なりスーパークラスとサブクラスでは同じ名前でも別の変数となる。
class Product
  #クラスインスタンス変数
  @name = 'Product'

  def self.name
    #クラスインスタンス変数
    @name
  end

  def initialize(name)
    #インスタンス変数
    @name = name
  end

  def name
    #インスタンス変数
    @name
  end
end

class DVD < Product
  @name = 'DVD'

  def self.name
    #クラスインスタンス変数を参照
    @name
  end

  def upcase_name
    #インスタンス変数を参照
    @name.upcase
  end

end

Product.name #=>"Product"
DVD.name #=> "DVD"

product = Product.new('A great movie')
product.name #=>"A great movie"

dvd = DVD.new('An awesome film')
dvd.name #=>"An awesome film"
dvd.upcase_name #=> "AN AWESOME FILM"

Product.name #=> "Product"
DVD.name #=> "DVD"
