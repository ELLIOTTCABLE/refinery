Refinery
========
Refinery stemmed from a very specific need that arose while writing
[attr_*][] — to be able to utilize the Ruby hooks (for example, the
`method_added` and `method_missing` methods) without “gobbling them up” so to
speak. Normally, had I used those methods (especially if my particular
implementation was very dependent on these methods operating in a specific
way), the person using my library would be precluded from using the same
methods in whatever class they included/extended my library into; if they used
one of those methods for some purpose, their definition would ‘overwrite’ mine,
thus quite possibly making my library (or their code using my library) cease
to function correctly.

The simple, singular purpose of Refinery is to ‘refine’ methods in such a way
that your important functionality can be assigned safely to these methods.
Any attempts to re-define a ‘refined’ method after the refining process will
simply ‘stack’ with your own implementation — your method code will execute
first, with further re-definitions each being executed in turn when the method
is called.

[attr_*]: <http://by.elliottcable.name/attr_splat.xhtml> "elliottcable's attr_splat project"

Usage
-----
Using Refinery is very simple - extend it into your class (or include it into
the Class class if you use it often), and then pass a method's name (as a
symbol) to the refine_method singleton method. A short example:
    
    class Something
      extend Refinery
      
      def method_missing meth, *args
        # Do some magic!
        puts 'abc'
      end
      
      refine_method :method_missing
    end
    
    # Later, somewhere else…
    
    class Nothing < Something
      def method_missing meth, *args
        # Do other magic, not knowing about the former magic!
        puts 'def'
      end
    end
    
    nothing = Nothing.new
    nothing.nonexistant_method
    
Once refined, any further re-openings of your class (or a descendant) and
re-definitions of the refined method will simply result in the implementations
'stacking' with eachother.

Care must obviously still be taken to ensure your code will 'stack' in a
friendly way with the other implementations — be sure to programmatically
check whatever may be necessary before executing your method's code!

Installation
------------
You can install Refinery as a pre-built gem, or as a gem generated directly
from the source.

The easiest way to install Refinery is to use [RubyGems][] to acquire the
latest 'release' version from [RubyForge][], using the `gem` command line tool:

    sudo gem install refinery # You'll be asked for your account password.

Alternatively, you can acquire it (possibly slightly more up-to-date,
depending on how often I update the gemspec) from GitHub as follows:

    # If you've ever done this before, you don't need to do it now - see http://gems.github.com
    gem sources -a http://gems.github.com
    sudo gem install elliottcable-refinery # You'll be asked for your account password.
    
Finally, you can build a gem from the latest source yourself. You need [git][],
as well as [rake][]:

    git clone git://github.com/elliottcable/refinery.git
    cd refinery
    rake install # You'll be asked for your account password.

[RubyGems]: <http://rubyforge.org/projects/rubygems/> "RubyGems - Ruby package manager"
[RubyForge]: <http://rubyforge.org/projects/refinery/> "Refinery on RubyForge"
[git]: <http://git-scm.com/> "git - Fast Version Control System"

Contributing
------------
You can contribute bug fixes or new features to Refinery by forking the project
on GitHub (you'll need to register for an account first), and sending me a
pull request once you've committed your changes.

Links
-----

- [GitHub](http://github.com/elliottcable/refinery "Refinery on GitHub") is the
    project's primary repository host, and currently also the project's home
    page
- [RubyForge](http://rubyforge.org/projects/refinery "Refinery on RubyForge") is
    out primary RubyGem host, as well as an alternative repository host
- [integrity](http://integrit.yreality.net/refinery "Refinery on yreality's integrity server")
    is out continuous integration server - if the top build on that page is
    green, you can assume the latest git HEAD is safe to run/install/utilize.
- [Gitorious](http://gitorious.org/projects/refinery "Refinery on Gitorious") is
    an alternative repository host
- [repo.or.cz](http://repo.or.cz/w/refinery.git "Refinery on repo.or.cz") is
    an alternative repository host

License
-------
Refinery is copyright 2008 by elliott cable.

Refinery is released under the [GNU General Public License v3.0][gpl], which
allows you to freely utilize, modify, and distribute all Refinery's source code
(subject to the terms of the aforementioned license).

[gpl]: <http://www.gnu.org/licenses/gpl.txt> "The GNU General Public License v3.0"