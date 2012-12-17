package Tkx::TclTk::Bind::IWidgets;

# ##############################################################################
# # Script     : Tkx::TclTk::Bind::IWidgets.pm                                 #
# # -------------------------------------------------------------------------- #
# # Sprache    : PERL 5                                (V)  5.8.xx  -  5.16.xx #
# # Standards  : Perl-Best-Practices                       severity 1 (brutal) #
# # -------------------------------------------------------------------------- #
# # Autoren    : Jürgen von Brietzke                                   JvBSoft #
# # Version    : 1.0.00                                            17.Dez.2012 #
# # -------------------------------------------------------------------------- #
# # Aufgabe    : Bindet die TclTk 'iwidgets4.0.2' Bibliothek an Perl::Tkx      #
# #              ------------------------------------------------------------- #
# #              Erstellen der Image-Bibliothek:                               #
# #              a) Download ActiveTcl 8.4.19.6 und installieren               #
# #              b) Erzeugen des TAR-Balls 'iwidgets.tar' mit folgenden Inhalt #
# #                 1) Verzeichnis 'itk3.4'                                    #
# #                 2) Verzeichnis 'itcl3.4'                                   #
# #                 3) Verzeichnis 'iwidgets4.0.2'                             #
# #              c) TAR-Ball unter '.../lib/Tkx/TclTk/Bind/TAR installieren    #
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

our $VERSION = q{1.0.00};

use Env::C;
use Tkx::TclTk::Bind qw{ &load_library };

sub BEGIN {

   my $temp_dir = load_library('iwidgets');

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

} # end of sub BEGIN

# ##############################################################################
# #                                   E N D                                    #
# ##############################################################################
1;

__END__

=pod

=head1 NAME

Tkx::TclTk::Bind::IWidgets - Load and binding for 'IWidgets' (4.0.2)

=head1 VERSION

This is version 1.0.00

=head1 SYNOPSIS

   use Tkx::TclTk::Bind::IWidgets;
   ...
   Tkx::package_require('Iwidgets');
   ...

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
