use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'Tkx::TclTk::Bind::IWidgets',
    VERSION_FROM      => 'lib/Tkx/TclTk/Bind/IWidgets.pm', # finds $VERSION
    PREREQ_PM         => { Env::C => 0,
                           Tkx::TclTk::Bind => 0
    },
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT  => 'Load and binding for Tcl/Tk IWidgets-Library',
       AUTHOR         => 'Jürgen von Brietzke <brietzkej@t-online.de>') : ()),
);
