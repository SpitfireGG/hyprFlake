set fish_greeting

jump shell fish | source

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.nix-profile/bin/ghc:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1


export http_proxy=
export https_proxy=
export all_proxy=


set -x GOPATH $HOME/go
set -x PATH $PATH /usr/bin/cargo

#-----------aliases----------------
#Syntax highlighting for manpage - better understanding :)
# can also be achieved by using Pager 


# ( gcc compilation)

function comp
    set -l output_name $argv[1]
    set -l source_files $argv[2..-1]
    
    set -l base_flags -Wall -Werror -Wextra -pedantic
    
    set -l debug_flags -g -O0  # Debug symbols, no optimization
    set -l release_flags -O2 -DNDEBUG  # Optimization, disable asserts
    set -l sanitizer_flags -fsanitize=address -fsanitize=undefined
    
    if gcc $base_flags -o $output_name $source_files
        echo""
        echo "✔️ Compilation successful"
        ./$output_name
    else
        echo""
        echo "⚠️ Compilation failed"
        return 1
    end
end


#---------------------------------------------------------------

function vv
    man $argv[1] $argv[2] | bat --plain --language=man
end


function copy
  find $argv[1] -type f -name $argv[2] | tee /dev/tty | xclip  -selection clipboard 
end 

function noc
  set -l command_string (string join " " $argv)

  echo "Running: $command_string" # Optional: show the user the command being run

  command $argv

  set -l exit_status $status

  if $exit_status -eq 0
    # Success (exit status 0)
    dunstify \
      -u low \
      -i emblem-ok \
      "Success" \
      "'$command_string' completed successfully."
  else
    # Failure (non-zero exit status)
    dunstify \
      -u critical \
      -i emblem-error \
      "Failed ($exit_status)" \
      "'$command_string' exited with status $exit_status."
  end

  return $exit_status
end

# dotnet specific
alias dn 'dotnet run'
alias db 'dotnet build'
alias dw 'dotnet watch run'


alias nvim '/home/archbishop/hyprnix/nixos-config/archbishop/nixvim/result/bin/nvim'
alias nixy '/home/archbishop/.config/nixvim/result/bin/nvim'
alias zz ranger
alias rmi 'rm -i'
alias fs 'source ~/.config/fish/config.fish'
alias bb 'cd ../../'
alias og 'nvim $(fzf --preview="bat {}")'

alias nb 'nix build'
alias sysb 'sudo nixos-rebuild --switch --flake .#archbishop --show-trace'
#-------------- git aliases ----------------
# -- functions --
function gstt
    git status --short | fzf --multi | awk '{print $2}' | xargs git add
      git status
end

function gswitch
  git checkout $argv[1] &&  nvim $(find . -type f -name '*.asm' | fzf)

end



#----------------- end -------------------------
alias gst 'git status .'


alias cbr 'git branch --sort=-committerdate | fzf --header "Checkout Recent Branch" --preview "git diff --color=always {1}" --pointer=":)" | xargs git checkout'
alias gp 'git push -u origin'
alias gpm 'git push -u origin main'
alias gll 'git log -1 HEAD --stat'
alias gc 'git commit -m'
alias grv 'git remote -v'
alias glog "git log --graph --pretty=format:'%C(red)%h%Creset -%C(yellow)%d%Creset %s %C(green)(%cr)%C(yellow)<%an>%Creset'"
alias gco 'git checkout'
alias gcb 'git checkout'
alias gua 'git reset'
alias gitmad 'git reset --hard HEAD'

# -- fast branch switching -- 
# --- project dependent ---
alias gbr='git branch -v'
alias gbf='git branch | fzf | xargs git checkout'  # Interactive branch selection with fzf
alias gch01='git checkout ch01'
alias gchasm='git checkout x86_64_intel_guide'




starship init fish | source
