class ScreenshotGenerator
  def initialize(file_location)
    @file = file_location
  end

  def duration
    value = %x(ffmpeg -i "#{@file}" 2>&1 | grep "Duration")
    value.split(" ")[1].chomp(",") if exit_status == 0
  end

  def total_seconds
    duration_array = duration.split(":")
    hours = duration_array[0].to_i
    minutes = duration_array[1].to_i
    seconds_array = duration_array[2].split(".")
    seconds = seconds_array[0].to_i
    miliseconds = seconds_array[1].to_i

    (hours*60*60) + (minutes*60) + seconds
  end

  def get_directory
    File.dirname(@file)
  end

  def render_screenshots(movie_dir, n)
    screenshots_directory = File.join(movie_dir, "screenshots")

    unless File.directory?(screenshots_directory)
      Dir.mkdir(screenshots_directory, 0700)
    end

    offset = 100
    seconds = total_seconds - offset
    frames = (seconds / n).floor

    for i in (1..n) do
      ffmpeg(frames, i, movie_dir)
      Screenshot.create!
    end
  end

  def ffmpeg(frames, i, movie_dir) 
    %x(ffmpeg -ss #{frames*i} -i "#{@file}" -an -vframes 1 -f image2 #{movie_dir}/screenshots/test#{i}.png 2>&1)
  end

  def exit_status
    $?.exitstatus
  end

  def directory_exists?(directory)
    File.directory?(directory)
  end
end
