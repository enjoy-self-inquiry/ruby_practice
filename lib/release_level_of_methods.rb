#protectedメソッドを使えば、体重weightの一般公開を避けつつ、仲間（同じクラス）の中でのみ、ほかのオブジェクトに公開することができる。
class User
  #weightは外部には公開しない。
  attr_reader :name

  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def heavier_than?(other_user)
    other_user.weight < @weight
  end

  protected

  #protectedメソッドなので同じクラスかサブクラスであればレシーバ付きで呼び出せる
  def weight
    @weight
  end
end
alice = User.new('Alice', 50)
bob = User.new('Bob', 60)

#同じクラスのインスタンスメソッド内であれば、weightが呼び出せる
alice.heavier_than?(bob) #=> false
bob.heavier_than?(alice) #=> true

#クラスの外ではweightは呼び出せない
alice.weight #=>NoMethodError
