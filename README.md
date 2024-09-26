Current setup: Nvim, yabai, skhd, zsh, kitty, clojure, colemak


Old config for linux: https://github.com/sid597/config


All keymappings are based on colemak. 

### Font rendering

Don't like kitty's default font rendering, so made the fonts thinner `text_composition_strategy 1.0` 
default value is `1.7`.

New favourite font is `JetBrains Mono` `Extra Light` `21.7`. After some playing around based on 
my astigmatism with incorrectly prescribed glasses, seating posture, distance from monitor, theme.
I found that I like the 1.66 scaling factor for font, it gives me a crisp looking font I can look 
at for hours. Currently using a 4k monitor native resolution on mac, recommended font size is `13.0`. 

Yeah the tradeoff is 69 lines at `21.7` vs 92 lines at `17.0` size. But you can use `CtrlShift-` 
decrease the font size dynamically. 


### Neovim

I used to use vim but since I started using clojure (2021) I moved to intellij with vim plugin. It worked fine,
the only tradeoff was I had to use mouse and it took too much memory. Memory consumption was under limit when
I was working on previous projects but now I need to run more and more programs simultaneously and my macbook
with its 16gb ram shits its pants.

I don't like the middle ground solutions, I want either full control or out of the box experience. So vscode, 
cursor doesn't cut it for me. So I am back to using nvim, it took some time to learn and setup for clojure but 
now its all done and I am love it. 


I am using github.com/Olical/nfnl to write the neovim config, fennel is close to clojure than lua or vimscript and I 
like it. 

As for theme I setteled on gruvbox, this looks best to me for clojure code. I have a bunch of themes in `plugins/theme.fnl`
its easy to change the theme and test out how each one looks.


### What I don't like


My main pain point is not being able to use intuitive keybindings. This is because of my current keyboard, I hate doing 
the finger gymnastics I have to do for `ctrl+shift+...` os `ctrl+cmd+...`. Why is the spacebar so big?? I am looking forward
to a better split keyboard with thumb cluster but they are expensive (much more for me due to import tax on top of the already
expensive keyboard). 
