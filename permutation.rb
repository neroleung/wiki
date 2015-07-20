class Permutation
  def execute(array)
    generate(array.length, array)
  end

  def generate(n, array)
    if n == 1
      puts "#{array}"
    else
      0.upto(n-1) do |i|
        generate(n-1, array)
        if n % 2 == 0
          swap(array, i, n-1)
        else
          swap(array, 0, n-1)
        end
      end
    end
  end

  def swap(array, i, j)
    tmp = array[i]
    array[i] = array[j]
    array[j] = tmp
  end
end

Permutation.new.execute([1,2,3,4])
