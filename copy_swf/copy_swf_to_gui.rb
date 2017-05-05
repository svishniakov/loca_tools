require 'fileutils'

gui_root = '/Users/sergey/Documents/My.com/_Projects/RO/UI/gui/'

# preparations
FileUtils.remove_dir(gui_root, force = true)
FileUtils.mkdir_p gui_root

# Files copy process
FileUtils.cp_r "/Users/sergey/Documents/My.com/_Projects/RO/UI/MMO/UI.swf", gui_root
FileUtils.cp_r "/Users/sergey/Documents/My.com/_Projects/RO/UI/MMO/", gui_root
FileUtils.rm_r Dir.glob('/Users/sergey/Documents/My.com/_Projects/RO/UI/gui/widgets/**/*.fla'), :force => true
