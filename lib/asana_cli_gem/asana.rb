class AsanaCliGem::Asana

  attr_accessor :name, :sanskrit, :summary, :tip, :url

  def self.poses
    # should return many instances of Asana
    # should I just use @@all?
    #puts <<~DOC
    #  1. Boat Pose
    #  2. Chair Pose
    #  3. Dolphin Plank Pose
    #DOC
    pose_1 = self.new
    pose_1.name = "Boat Pose"
    pose_1.sanskrit = "Paripurna Navasana"
    pose_1.summary = "An ab and deep hip flexor strengthener, Paripurna Navasana requires you to balance on the tripod of your sitting bones and tailbone"
    pose_1.tip = "You can practice a preparation for this pose periodically throughout your day without even leaving your chair. Sit on the front edge of a seat with your knees at right angles. Grab onto the sides of the seat with your hands and lean slightly forward. Firm your arms and lift your buttocks slightly off the seat, then raise your heels slightly off the floor (but not the balls of your feet). Let the heads of your thigh bones sink into the pull of gravity and push the top of your sternum forward and up."
    pose_1.url = "https://www.yogajournal.com/poses/full-boat-pose"

    pose_2 = self.new
    pose_2.name = "Chair Pose"
    pose_2.sanskrit = "Utkatasana"
    pose_2.summary = "Chair Pose clearly works the muscles of the arms and legs, but it also stimulates the diaphragm and heart."
    pose_2.tip = "To help you stay in this pose, perform it near a wall. Stand with your back to the wall, a few inches away from the wall. Adjust your position relative to the wall so that when you bend into the position, your tailbone just touches and is supported by the wall."
    pose_2.url = "https://www.yogajournal.com/poses/chair-pose"

    [pose_1, pose_2]
  end

end
