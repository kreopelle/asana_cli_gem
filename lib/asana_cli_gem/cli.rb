# The CLI Controller

class AsanaCliGem::CLI

  attr_reader :poses

  def call
    # backbone of CLI, calls other methods (is there another name for this?)
    puts "Strengthening Yoga Poses:"
    list_poses
    menu
    goodbye
  end

  def list_poses
    # where available asana objects will be listed for access
    @poses = AsanaCliGem::Asana.poses
    @poses.each_with_index do |pose, i|
      puts "#{i+1}. #{pose.name}"
    end

  end

  def menu
    # user interaction interface
    puts "Please enter the number of the pose you'd like to learn more about, type list to see all poses, or exit to end program."
    input = gets.strip.downcase
    # normalizes text input
    if input != "exit"
      input = input.to_i - 1
      puts "Name: #{poses[input].name}"
      puts "Sanskrit Name: #{poses[input].sanskrit}"
      puts "#{poses[input].summary}"
      puts "#{poses[input].tip}"
      puts "#{poses[input].url}"
      case input
      when "1"
        puts "More info on Boat Pose"
      when "2"
        puts "More info on Chair Pose"
      when "list"
        list_poses
      else
        puts "My apologies, I didn't recognize that input."
      end
      menu
    end
  end

  def goodbye
    # exit message
    puts "Namaste"
  end

end
