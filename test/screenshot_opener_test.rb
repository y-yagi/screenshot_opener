require "test_helper"

class DrivenBySeleniumWithChrome < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome
end

module Rails
  def self.root
    Pathname.getwd.join("test/fixtures")
  end
end

class ScreenshotOpenerTest < Minitest::Test
  def test_open_image_when_screenshot_is_taken
    new_test = DrivenBySeleniumWithChrome.new("x")
    mock = MiniTest::Mock.new
    mock.expect(:call, true)

    new_test.stub :passed?, false do
      new_test.stub :save_image, nil do
        new_test.stub(:open_image, mock) do
          quietly { new_test.take_screenshot }
        end
      end
    end

    mock.verify
  end
end
