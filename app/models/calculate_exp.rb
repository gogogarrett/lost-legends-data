module CalculateExp
  extend self

  def cumulative_exp(level)
    @@cumulative_exp ||= {}

    @@cumulative_exp[level] ||= 1.upto(level).reduce(0) do |sum, level|
      sum += self.exp(level)
    end
  end

  def exp(level)
    @@exp ||= {}
    @@exp[level] ||= ( level + 300 * 2^(level / 7) ).div(4)
  end
end
