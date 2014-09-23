class TeamClues
  def self.clue_ids_in_random_order
    hh_clue_ids = Clue.where("clue_type is NOT NULL").load.map(&:id).shuffle
    other_clue_ids = Clue.where("clue_type is NULL").load.map(&:id).shuffle

    a = other_clue_ids.each_slice(other_clue_ids.length / hh_clue_ids.length).to_a
    b = hh_clue_ids.each_slice(1).to_a

    c = []
    a.each_with_index do |other_clue_list, index|
      x = other_clue_list + b[index]
      c << x.shuffle
    end
    c
  end

  def self.next_clue_for!(team_id)
    team = Team.find(team_id)

    clue_ids_ordered = team.clue_order.split(",")
    next_clue_index = team.current_clue_index == clue_ids_ordered.length - 1 ? 0 : team.current_clue_index + 1

    team.current_clue_index = next_clue_index
    team.save!

    Clue.find(clue_ids_ordered[next_clue_index])
  end
end