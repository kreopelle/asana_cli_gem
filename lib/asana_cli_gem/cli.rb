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

  def poses
    @poses = AsanaCliGem::Asana.all
  end

  def list_poses
    # where available asana objects will be listed for access
    poses.each_with_index do |pose, i|
      puts "#{i+1}. #{pose.name}"
    end
  end

  def menu
    # user interaction interface
    puts "Please enter the number of the pose you'd like to learn more about, type list to see all poses, or exit to end program."
    input = gets.strip.downcase
    # normalizes text input
    if input != "exit"
      if input.to_i > 0
        input = input.to_i - 1
        selected_pose = poses[input]
        puts "Name: #{selected_pose.name}"
        puts "Sanskrit Name: #{selected_pose.sanskrit}" if selected_pose.sanskrit != nil
        puts "#{selected_pose.summary}"
        puts "Beginner's Tip: #{selected_pose.tip}" if selected_pose.tip != nil
        puts "To learn more, visit: #{selected_pose.url}"
      elsif input == "list"
        list_poses
      else
        puts "My apologies, I didn't recognize that input."
    end
      menu
    end
  end

  def goodbye
    # exit message
    puts "Thank you for visiting the Asana CLI Gem!"
    puts "Namaste"
  end

end
