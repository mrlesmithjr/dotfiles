# REPO INFO

This repo is for a collection of my `dotfiles` which I use.

My goal will be to make as many of these as portable between `Linux` distros and `MacOS`.

#### `.bashrc` and `.bash_profile`

To make these portable between `Linux` and `MacOS` we need to use both. The reason is that for `MacOS` the default is to use `.bash_profile` and ignore `.bashrc` whereas on `Linux` `.bash_profile` is only used for interactive logins (ssh, terminal, and etc.) and ignored from GUI based terminal sessions. So to make these portable the only thing added to `.bash_profile` is below:

```bash
# .bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```

And then we can add all of our goodies to `.bashrc`. And in doing so, everything works as planned in all scenarios between `Linux` and `MacOS`.

#### `.gitconfig`

Make sure to edit this file to match your preferences.

## License

BSD

## Author Information

Larry Smith Jr.

-   [@mrlesmithjr](https://www.twitter.com/mrlesmithjr)
-   [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
-   mrlesmithjr [at] gmail.com
