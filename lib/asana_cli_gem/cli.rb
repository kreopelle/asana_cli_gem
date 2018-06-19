# The CLI Controller

class AsanaCliGem::CLI

  def call
    puts "Strengthening Yoga Poses:"
    list_poses
    menu
    goodbye
  end

  def list_poses
    puts <<~DOC
      1. Boat Pose
      2. Chair Pose
      3. Dolphin Plank Pose
    DOC
  end

  def menu
    puts "Enter the number of the pose you'd like to learn more about"
    input = gets.strip.downcase
    if input != "exit"
      case input
      when "1"
        puts "More info on Boat Pose"
      when "2"
        puts "More info on Chair Pose"
      end
    end
  end

  def goodbye
    puts "Namaste"
  end

end
