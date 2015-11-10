
class Fixnum

  def isprime?()
    if self==1
      return false
    end
    (2..self-1).each do |i|
      if self%i==0
        return false
      end
    end
    return true
  end

  def iscoprimewith?(m)
    if m == self
      return false
    end
    if self==1 || m==1
      return false
    end
      (2..self-1).each do |i|
        if self%i==0
          if m%i==0
            return false
          end
        end
      end
      return true
    end
  def get_coprimes()
    coprimes = []
    (2..self).each do |i|
      if i.iscoprimewith?(self)
        coprimes.push(i)
      end
    end
    return coprimes
  end
end
