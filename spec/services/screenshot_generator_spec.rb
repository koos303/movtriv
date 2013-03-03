require 'spec_helper' 

describe ScreenshotGenerator do
  let(:movie) { create(:movie, { title: "Test movie" } ) }

  before do
    @generator = ScreenshotGenerator.new("spec/fixtures/test.mkv")
  end

  it "returns the duration of the file" do
    @generator.duration.should eq("00:00:32.53")
  end

  it "finds the directory of the movie file" do
    directory = @generator.get_directory
    directory.should eq("spec/fixtures")
  end

  it "can calculate the total number of seconds" do
    @generator.total_seconds.should be(32)
  end

  context "generating files" do
    before do
      cleanup_screenshot_directory
    end

    it "can check if a directory exists" do
      @generator.directory_exists?(".").should be(true)
    end

    it "creates a screenshot directory" do
      @generator.render_screenshots("tmp", 3)
      File.directory?("tmp/screenshots").should be(true)
    end

    it "renders N screenshots" do
      @generator.should_receive(:ffmpeg).exactly(3).times.and_return(0)

      expect {
        @generator.render_screenshots("tmp", 3)
      }.to change { Screenshot.count }.by(3) 
    end
  end
end

def cleanup_screenshot_directory
  dir = "tmp/screenshots"
  if File.directory?(dir)
    %x(rm -rf #{dir})
  end
end
