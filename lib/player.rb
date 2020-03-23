class Player
  attr_accessor :name
  attr_reader :count

  def initialize(name)
    @name = name
    @count = 0
  end

  def update_wins
    @count += 1
  end
end
