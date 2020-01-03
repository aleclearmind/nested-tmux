# Nested tmux

This is a simple tmux configuration enabling to have arbitrarily many nested tmux sessions.

# Demo

![Demo](/demo.gif?raw=true "Demo")

# Quick start

```
mkdir ~/.tmux.conf.d/
cd ~/.tmux.conf.d/
git clone https://github.com/aleclearmind/nested-tmux.git
mv ~/.tmux.conf ~/.tmux.conf.backup
echo "source ~/.tmux.conf.d/nested-tmux/active-row.conf" > ~/.tmux.conf
tmux
```

# Shortcuts

* `Ctrl + a, Ctrl + c` or `Ctrl + t`: create a new window
* `Ctrl + a, Ctrl + s`: create a new nested tmux session and ask a name for it
* `Ctrl + a, Ctrl + A`: switch to last window
* `Ctrl + a, A`: rename current window
* `Alt + Right`: move to the next window of the current row
* `Alt + Left`: move to the previous window of the current row
* `Alt + Up`: move to the inner tmux session
* `Alt + Down`: move to the outer tmux session

# FAQ

* **Q**: Why do we need this?

  **A**: When working with many projects it's useful to have a dedicated tmux session with three windows per-project: one with a text editor, one for git and one for the build directory.
         This is why this project was born.
		 However, nested tmux sessions are addictive and quickly become in-terminal *workspaces* that can be used for any purpose.

* **Q**: Does it support multiple nested layers of tmux sessions?

  **A**: Yes.

* **Q**: Has it been tested with other configuration X?

  **A**: No.

* **Q**: How is this implemented?

  **A**: The idea is two have two configurations, `active-row.conf` and `inactive-row.conf`.
         The former is for the currently active row in the nested tmux tree, the second for the inactive rows.
		 Each session know who its parent is through the `TMUX_PARENT` environment variable (set in the `new-tmux` script).
		 When `Alt + Up` is pressed, the `Alt + F12` combination is sent to the active window.
		 If the active window is a nested tmux session, it will load `active-row.conf` and forces loading `inactive-row.conf` in its parent (i.e., the row that originally received the `Alt + Up` key combination.
		 When `Alt + Down` is pressed, the current row loads `inactive-row.conf` and forces loading `active-row.conf` in its parent.
