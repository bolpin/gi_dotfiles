require 'rake'

desc "install the dot files into user's home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE id_dsa.pub].include? file

    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end

  # Handle ssh pubkey on its own
  # puts "Linking public ssh key"
  # system %Q{ln -s "$PWD/id_rsa.pub" "$HOME/.ssh/id_rsa.pub"}

  # TODO: Setup neovim
    # mkdir ~/.config
    # ln -s ~/.vim ~/.config/nvim
    # ln -s ~/.vimrc ~/.config/nvim/init.vim

  system %Q{mkdir ~/.tmp}
end

def replace_file(file)
  # system %Q{rm "$HOME/.#{file}"}
  system %Q{mkdir "$HOME/old_dotfiles_etc"}
  system %Q{mv "$HOME/.#{file}" "$HOME/old_dotfiles_etc"}
  link_file(file)
end

def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
