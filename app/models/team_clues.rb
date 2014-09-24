class TeamClues
  def self.clue_ids_in_random_order
    hh_clue_ids = Clue.where(clue_type: "b").load.map(&:id).shuffle
    other_clue_ids = Clue.where(clue_type: "hh").load.map(&:id).shuffle

    a = other_clue_ids.each_slice((other_clue_ids.length / hh_clue_ids.length.to_f).ceil).to_a
    b = hh_clue_ids.each_slice(1).to_a

    p a
    p b

    c = []
    a.each_with_index do |other_clue_list, index|
      x = other_clue_list + b[index]
      c << x.shuffle
    end
    c.flatten
  end

  def self.next_clue_for!(team_id)
    team = Team.find(team_id)

    clue_ids_ordered = team.clue_order.split(",")
    next_clue_index = team.current_clue_index == clue_ids_ordered.length - 1 ? 0 : team.current_clue_index + 1

    team.current_clue_index = next_clue_index
    team.save!

    Clue.find(clue_ids_ordered[next_clue_index])
  end

  def self.clue_for_team(team_id)
    team = Team.find(team_id)
    clue_ids_ordered = team.clue_order.split(",")
    Clue.find(clue_ids_ordered[team.current_clue_index])
  end

  def self.last_clue?(team_id, clue_id)
    team = Team.find(team_id)
    clue_ids_ordered = team.clue_order.split(",")
    clue_ids_ordered.last.to_i == clue_id
  end
end