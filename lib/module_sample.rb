#継承は使えないが、「ログを出力する」という共通の機能を持たせる（"ミックスイン"させる）ため、ログ出力用のモジュールを定義
module Loggable
  def log(text)
    puts "[LOG]#{text}"
  end
end

class Product
  #上で作ったモジュールをincludeする
  include Loggable

  def title
    #logメソッドはLoggableモジュールで定義したメソッド
    log "title is called."
    "A great movie"
  end
end

class User
  #同様にincludeする
  include Loggable

  def name
    #Loggableモジュールのメソッドが使える
    log "name is called."
    "Alice"
  end
end

product = Product.new
product.title
#=>[LOG]title is called.
#=> "A great movie"

user = User.new
user.name
#=>[LOG]name is called.
#=>"Alice"
