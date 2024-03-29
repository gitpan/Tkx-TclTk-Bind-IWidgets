package Tkx::TclTk::Bind::IWidgets;

# ##############################################################################
# # Script     : Tkx::TclTk::Bind::IWidgets.pm                                 #
# # -------------------------------------------------------------------------- #
# # Sprache    : PERL 5                                (V)  5.8.xx  -  5.16.xx #
# # Standards  : Perl-Best-Practices                       severity 1 (brutal) #
# # -------------------------------------------------------------------------- #
# # Autoren    : J�rgen von Brietzke                                   JvBSoft #
# # Version    : 1.2.00                                            15.Jun.2013 #
# # -------------------------------------------------------------------------- #
# # Aufgabe    : Bindet die TclTk 'iwidgets4.0.2' Bibliothek an Perl::Tkx      #
# # -------------------------------------------------------------------------- #
# # Pragmas    : strict, warnings                                              #
# # -------------------------------------------------------------------------- #
# # Module     : Env::C                                  ActivePerl-PPM-Module #
# #              ------------------------------------------------------------- #
# # Module     : Tkx::TclTk::Bind                               Private-Module #
# # -------------------------------------------------------------------------- #
# # Copyright  : Frei unter GNU General Public License bzw. Artistic License   #
# # -------------------------------------------------------------------------- #
# # TODO       : POD - Documentation                                           #
# ##############################################################################

use strict;
use warnings;

our $VERSION = q{1.2.00};

use Env::C;
use Tkx::TclTk::Bind qw{ &load_library };

sub BEGIN {

   my $temp_dir = load_library( 'iwidgets', 'iwidgets4.0.2' );

   # --- Steuervariablen belegen -----------------------------------------------
   my $path_to_iwidgets_library
      = File::Spec->catfile( $temp_dir, 'iwidgets4.0.2' );
   my $path_to_itk_library  = File::Spec->catfile( $temp_dir, 'itk3.4' );
   my $path_to_itcl_library = File::Spec->catfile( $temp_dir, 'itcl3.4' );

   # --- Environment-Variablen setzen ------------------------------------------
   Env::C::setenv( 'ITCL_LIBRARY', $path_to_itcl_library );
   Env::C::setenv( 'ITK_LIBRARY',  $path_to_itk_library );

   # --- IWidgets in Tkx binden ------------------------------------------------
   Tkx::lappend( '::auto_path', $path_to_itk_library );
   Tkx::lappend( '::auto_path', $path_to_itcl_library );
   Tkx::lappend( '::auto_path', $path_to_iwidgets_library );
   Tkx::package_require('Iwidgets');

} # end of sub BEGIN

sub END {

   Env::C::unsetenv('ITCL_LIBRARY');
   Env::C::unsetenv('ITK_LIBRARY');

} # end of sub END

# ##############################################################################
# #                                   E N D                                    #
# ##############################################################################
1;

__END__

=pod

=head1 NAME

Tkx::TclTk::Bind::IWidgets - Bind the Tcl/Tk B<'iwidgets4.0.2'>-library to Tkx.

=head1 VERSION

This is version 1.2.00

=head1 SYNOPSIS

   use Tkx::TclTk::Bind::IWidgets;
   ...
   $mw = Tkx::widget->new(q{.});
   $mw->Tkx::wm_title('Test');
   ...
   my $ca = $mw->new_iwidgets__Calendar();
   ...
   Tkx::grid( $ca, -column => 0, -row => 0 );
   ...
   Tkx::MainLoop();


=head1 DESCRIPTION

This modul load the B<iwidgets4.0.2>-library in the 'User-TEMP-Directory' and
binding the library on B<Tkx>. The modul ship the iwidget library as TAR-Ball
for the OS-System B<MSWin32>, B<Linux> (32 and 64-bit) and B<Mac OS X>.

This modul provide support for 'ActiveState PerlApp'. You can import library as
TAR-Ball from directory B<.../lib/Tkx/TclTk/Bind/TAR/...> over 'Bound files' in
PerlApp.

When program will ending, the modul delete all files from 'User-TEMP'-Directory.

=head1 PRAGMAS

=over 3

=item strict

=item warnings

=back

=head1 MODULE

=over 3

=item Env::C

=item Tkx::TclTk::Bind

=back

=head1 AUTHOR

Juergen von Brietzke <juergen.von.brietzke@t-online.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) by Juergen von Brietzke.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
