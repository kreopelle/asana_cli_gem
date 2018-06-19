class AsanaCliGem::Asana

  def self.poses
    # should return many instances of Asana
    # should I just use @@all?
    puts <<~DOC
      1. Boat Pose
      2. Chair Pose
      3. Dolphin Plank Pose
    DOC
  end

end
