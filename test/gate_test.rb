require 'minitest/autorun'
require '../lib/gate'
require '../lib/ticket'

class GateTest < Minitest::Test

  def setup
    #setupとすることで、テストメソッドが実行前にこのメソッドが毎回呼ばれる。
    @umeda = Gate.new(:umeda)
    @juso = Gate.new(:juso)
    @mikuni = Gate.new(:mikuni)
  end

  #ケース1「1区間・運賃ちょうど」
  def test_umeda_to_juso
    #購入した運賃(@fare=150)の入ったチケットインスタンスの作成、変数ticketに代入
    ticket = Ticket.new(150)

    #@umedaオブジェクトに対して、運賃(ticketインスタンス)を引数としたenterメソッド呼出し。
    #enterメソッドでは、運賃(ticketインスタンス)に対して、駅名(@name)を引数としたstampメソッドをさらに実行
    #stampメソッドでは、駅名(@name)を引数として受取り、それをインスタンス変数@stamped_atに代入。
    #これにより、Ticketクラスから作成されたオブジェクト(ticketインスタンス)は、駅名を保持できる。
    @umeda.enter(ticket)

    #assert "a"で、aが真であればパスする

    #@jusoオブジェクトに対して、運賃(ticketインスタンス)を引数としたexitメソッドを呼出し。
    #exitメソッドでは、運賃(ticketインスタンス)を引数としたcalc_fareメソッドをさらに実行
    #calc_fareメソッドは、運賃(ticketインスタンス)を引数として、そのインスタンスが保持する駅名と合致する配列(STATIONS)の添え字を、fromに代入
    #さらに、駅名@name(つまり:juso)と合致する配列(STATIONS)の添え字をtoに代入。
    #添え字to - 添え字from　の差を、区間(distance)に代入
    #最終的に、配列(FARES)の数値(150,190いずれか)を返す。
    #calc_fareの戻り値（150または190)を、変数fareに代入。ここには、本来購入するべき運賃額が代入されていることになる。
    #変数fareと、購入運賃(ticket = ticketインスタンス)のインスタンス変数@fareとを比較し、正規運賃以上に購入運賃が高ければtrueを返す。
    assert @juso.exit(ticket)
  end

  #ケース2「2区間・運賃足りず」
  def test_umeda_to_mikuni_when_fare_is_not_enough
    ticket = Ticket.new(150)
    @umeda.enter(ticket)
    #refute "a"で、aが偽であればパスする。
    refute @mikuni.exit(ticket)
  end

  #ケース3「2区間・運賃ちょうど」
  def test_umeda_to_mikuni_when_fare_is_enough
    ticket = Ticket.new(190)
    @umeda.enter(ticket)
    assert @mikuni.exit(ticket)
  end

  #ケース4「1区間・梅田以外の駅から乗車」
  def test_juso_to_mikuni
    ticket = Ticket.new(150)
    @juso.enter(ticket)
    assert @mikuni.exit(ticket)
  end

end
