Prezto — Instantly Awesome Zsh
==============================

Prezto is the configuration framework for [Zsh][1]; it enriches the command line
interface environment with sane defaults, aliases, functions, auto completion,
and prompt themes. 

It is a fork of [Prezto][2] with some modifications to facilitate zsh usage, and it
will be synchronized with the Prezto master branch to obtain the newest
features.

![snapshot](https://raw.githubusercontent.com/kepbod/prezto/kepbod/snapshot.jpg)

Installation
---------

**via 'curl'**

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/prezto/kepbod/setup.sh) -i
```

**via 'wget'**

```bash
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/prezto/kepbod/setup.sh -O -) -i
```

Updating

```bash
bash $HOME/.zprezto/setup.sh -n
```

Resources
---------

The [Zsh Reference Card][3] and the [zsh-lovers][4] man page are indispensable.

License
-------

This project is licensed under the MIT License.

[1]: http://www.zsh.org
[2]: https://github.com/zsh-users/prezto
[3]: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
[4]: http://grml.org/zsh/zsh-lovers.html
