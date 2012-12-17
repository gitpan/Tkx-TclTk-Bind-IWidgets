use English qw{-no_match_vars};
use Tkx;
use Tkx::TclTk::Bind::IWidgets;

use strict;

my $mw = Tkx::widget->new(q{.});
$mw->Tkx::wm_title('Test');
$mw->Tkx::wm_minsize( 810, 560 );

my $ca = $mw->new_iwidgets__Calendar();
my $st = $mw->new_iwidgets__Scrolledtext();

Tkx::grid( $ca, -column => 0, -row => 0 );
Tkx::grid( $st, -column => 0, -row => 1 );

Tkx::MainLoop();
