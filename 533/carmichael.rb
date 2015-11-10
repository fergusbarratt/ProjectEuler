
class Fixnum

  def isprime?()
    (2..self).each do |i|
      if self%i==0
                 return false
      end
    end
    return true
  end

  def iscoprimewith?(m)
    if self.isprime? & m.isprime?
        return true
      end
      (2..self).each do |i|
        if self%i==0
          if m%i==0
            return false
          end
        end
      end
      return true
    end
end
