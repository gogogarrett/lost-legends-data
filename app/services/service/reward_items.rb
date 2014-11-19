module Service
  class RewardItems < RewardBase

    def call
      reward_random_weapon if should_reward?
    end

    private
    def should_reward?
      random_number.even?
    end

    def random_number
      (1..100).to_a.sample
    end

    def reward_random_weapon
      [::Item.all.map(&:id) - player.items.map(&:id)].flatten.sample
    end
  end
end
