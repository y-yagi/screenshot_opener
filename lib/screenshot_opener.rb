require "screenshot_opener/version"
require "action_dispatch/system_test_case"
require "active_support/core_ext/module/attribute_accessors"

module ScreenshotOpener
  mattr_accessor :command, instance_writer: false

  def take_screenshot
    super
    open_image
  end

  def open_image
    system("#{open_command} #{image_path}") if open_command
  end

  private
    def open_command
      @open_command ||= begin
        if self.command
          self.command
        else
          %w(xdg-open gnome-open open).detect { |cmd| cmd_exists?(cmd) }
        end
      end
    end

    def cmd_exists?(cmd)
      system("type '#{cmd}'", out: File::NULL, err: File::NULL)
      $?.exitstatus == 0
    end
end

if ActionPack.version >= Gem::Version.new("5.2.0")
  ActiveSupport.on_load(:action_dispatch_system_test_case) do
    self.include(ScreenshotOpener)
  end
else
  ActionDispatch::SystemTestCase.include(ScreenshotOpener)
end
ENV["RAILS_SYSTEM_TESTING_SCREENSHOT"] ||= "simple"
