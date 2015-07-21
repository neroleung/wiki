class YatesShuffle
  def initialize(array)
    (array.length - 1).downto(1) do |i|
      j = rand(i+1)
      array[i], array[j] = array[j], array[i] unless i == j
    end
    puts "#{array}"
  end
end

10.times do
  YatesShuffle.new([1,2,3,4,5])
end
