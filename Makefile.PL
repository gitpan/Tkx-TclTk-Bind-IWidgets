if (  $^O =~ /MSWin32/ismx
   or $^O =~ /linux/ismx
   or $^O =~ /darwin/ismx )
{
   use ExtUtils::MakeMaker;

   # See lib/ExtUtils/MakeMaker.pm for details of how to influence
   # the contents of the Makefile that is written.
   WriteMakefile(
      NAME         => 'Tkx::TclTk::Bind::IWidgets',
      VERSION_FROM => 'lib/Tkx/TclTk/Bind/IWidgets.pm',    # finds $VERSION
      PREREQ_PM    => {
         Env::C           => 0,
         Tkx::TclTk::Bind => 0
      },
      (  $] >= 5.005
         ?    ## Add these new keywords supported since 5.005
            (
            ABSTRACT =>
               'Bind the Tcl/Tk iwidgets4.0.2-library to Tkx - for MSWin, Linux and MacOS',
            AUTHOR => 'Jürgen von Brietzke <brietzkej@t-online.de>'
            )
         : ()
      ),
   );
}
else {
   {
      print("OS unsupported\nModul supported Linux, MSWin32 and MacOS X")
         and exit;
   }
}
