# method composition
Easily build classes based on function composition well known e.g. from elixir.

## usage
1. create class, e.g. Alphabet an define methods
```
class Alphabet

  private

  def abc(alph)
    alph << 'abc'
  end

  def defg(alph)
    alph << 'defg'
  end
end
```
2. include MethodComposition module and define order in which methods will be called
```
class Alphabet
  include MethodComposition

  methods_chain :abc, :defg

  private

  def abc(alph)
    alph << 'abc'
  end

  def defg(alph)
    alph << 'defg'
  end
end
```
3. call class and check if it works
```
print Alphabet.call('alphabet: ')
> alphabet: abcdefg
```

You can also define many classes and combine them together using function composition from ruby, e.g.
```
class Alphabet
  include MethodComposition

  methods_chain :abc, :defg

  private

  def abc(alph, num)
    alph << 'abc' * num
  end

  def defg(alph)
    alph << 'defg'
  end
end

class Numbers
  include MethodComposition

  methods_chain :one_two, :three_four

  private

  def one_two(alph)
    alph << '12'
  end

  def three_four(alph)
    alph << '34'
  end
end

class Printer
  include MethodComposition

  methods_chain :print, :flip, :print

  private

  def print(alph)
    puts alph
    alph
  end

  def flip(alph)
    alph.reverse
  end
end

# first element on the left has to bee proc
(proc { |x| x } << Printer << Numbers << Printer << Alphabet).call('alphabet: ', 2)
> alphabet: abcabcdefg
  gfedcbacba :tebahpla
  gfedcbacba :tebahpla1234
  4321alphabet: abcabcdefg
```
