Prezto — Instantly Awesome Zsh
==============================

Prezto is the configuration framework for [Zsh][1]; it enriches the command line
interface environment with sane defaults, aliases, functions, auto completion,
and prompt themes.

This Repository forked here is to integrate with [iztv][2] framework. It owns some
modifications to make it more easy and beautiful to use in the [iztv][2] framework.
It will be synchronized with the Prezto master branch to obtain the newest
features.

![snapshot](https://raw.githubusercontent.com/kepbod/prezto/master/snapshot.jpg)

Installation
---------

**via 'curl'**

```bash
bash <(curl -L https://raw.githubusercontent.com/kepbod/prezto/master/setup.sh) -i
```

**via 'wget'**

```bash
bash <(wget --no-check-certificate https://raw.githubusercontent.com/kepbod/prezto/master/setup.sh -O -)
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

(The MIT License)

Copyright (c) 2009-2013 Robby Russell, Sorin Ionescu, and contributors.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

[1]: http://www.zsh.org
[2]: https://github.com/kepbod/iztv
[3]: http://www.bash2zsh.com/zsh_refcard/refcard.pdf
[4]: http://grml.org/zsh/zsh-lovers.html
