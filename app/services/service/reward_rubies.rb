module Service
  class RewardRubies < RewardBase

    protected
    def smallest_array
      (1..5).to_a
    end

    def smaller_array
      (6..10).to_a
    end

    def small_array
      (10..25).to_a
    end

    def big_array
      (26..100).to_a
    end
  end
end
