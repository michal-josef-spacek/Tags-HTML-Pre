use strict;
use warnings;

use Tags::HTML::Pre;
use Tags::Output::Raw;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Tags::HTML::Pre->new;
isa_ok($obj, 'Tags::HTML::Pre');

# Test.
$obj = Tags::HTML::Pre->new(
	'tags' => Tags::Output::Raw->new,
);
isa_ok($obj, 'Tags::HTML::Pre');
