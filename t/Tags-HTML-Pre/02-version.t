use strict;
use warnings;

use Tags::HTML::Pre;
use Test::More 'tests' => 2;
use Test::NoWarnings;

# Test.
is($Tags::HTML::Pre::VERSION, 0.01, 'Version.');
