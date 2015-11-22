
class Fixnum

  def isprime?() 
    if self==1 
      return false
      end
    if self==2 
      return true
    end
    (2..(self-1).each do |i| 
      if (self)%i==0
        return false
      end
    end
    return true

  def iscoprimewith?(m)
    # euclidean algorithm
    k=0
    q=0
    r1=self
    r2=m
    loop do
      k+=1
      if r1==0
        if r2!=0
          return true
        else
          puts r1, r2
          return false
        end
      end
        loop do
          q+=1
          if r1-q*r2<r2
            r2=r1
            r1=r1-q*r2
            break
          end
        end
      end
    end

  def get_coprimes()
    coprimes = []
    (3..self).each do |i|
      if i.iscoprimewith?(self)
        coprimes.push(i)
      end
    end
    return coprimes
  end

def carmichael(n)
  coprimes = n.get_coprimes()
  coprimes.each do |a| # loop through coprimes
    m=0
    loop do # infinite loop through all positive integers
      if m>40
        break
      end
      m+=1
      puts "#{a}^#{m}" 
      if (a**m)%n==1 # if this a works with this m break and try the next a with this m
        puts "#{a}^#{m}%#{n}==1"
        mtest= m
        m_works = false
        coprimes.each do |atest|
            puts atest
            if (atest**mtest)%n==1             # if this m doesn't work with any of the coprimes, break and set the bool to false
              m_works = true # otherwise the bool should remain true till the end of the loop
            else
              m_works = false
              puts "#{atest}^#{mtest}%#{n}!=1"
              break
            end
          end
          if m_works
            return m
          end  
          end
        end
      end
    end
  end
end
