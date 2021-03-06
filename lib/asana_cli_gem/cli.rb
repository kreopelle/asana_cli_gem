class AsanaCliGem::CLI
  attr_reader :poses, :scraper

  def call
    welcome
    @scraper = AsanaCliGem::Scraper.new
    scraper.pose_collector
    list_poses
    menu
    goodbye
  end

  def welcome
    puts "Welcome to the Asana Finder CLI!"
    puts "Learn more about strengthening yoga poses, known in Sanskrit as asanas."
  end

  def poses
    @poses = AsanaCliGem::Asana.all
  end

  def list_poses
    puts "Strengthening Yoga Poses:"

    poses.each_with_index do |pose, index|
      puts "#{index+1}. #{pose.name}"
    end
  end

  def menu
    puts "Please enter the number of the pose you'd like to learn more about, 'list' to see all poses, or 'exit' to end program."
    input = gets.strip.downcase

    if input != "exit"
      if input.to_i > 0 && input.to_i <= poses.size
        input = input.to_i - 1
        selected_pose = poses[input]

        scraper.asana_details(selected_pose.url) if selected_pose.summary == nil

        puts "Name: #{selected_pose.name}"
        puts "Sanskrit Name: #{selected_pose.sanskrit}" if selected_pose.sanskrit
        puts selected_pose.summary
        puts "Beginner's Tip: #{selected_pose.tip}" if selected_pose.tip
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
    puts "Thank you for using the Asana CLI Gem!"
    puts "Namaste."
  end

end
