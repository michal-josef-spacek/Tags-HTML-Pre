package Tags::HTML::Pre;

use base qw(Tags::HTML);
use strict;
use warnings;

our $VERSION = 0.01;

# Constructor.
sub new {
	my ($class, @params) = @_;

	# No CSS support.
	push @params, 'no_css', 1;

	my $self = $class->SUPER::new(@params);

	# Object.
	return $self;
}

sub _process {
	my ($self, $content) = @_;

	$self->{'tags'}->put(
		['b', 'pre'],
		['d', $content],
		['e', 'pre'],
	);

	return;
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

Tags::HTML::Pre - Tags helper for preserved content.

=head1 SYNOPSIS

 use Tags::HTML::Pre;

 my $obj = Tags::HTML::Pre->new(%params);
 $obj->process($content);
 $obj->process_css;

=head1 METHODS

=head2 C<new>

 my $obj = Tags::HTML::Pre->new(%params);

Constructor.

=over 8

=item * C<css>

'CSS::Struct::Output' object for L<process_css> processing.

It's required.

Default value is undef.

=item * C<tags>

'Tags::Output' object.

Default value is undef.

=back

=head2 C<process>

 $obj->process($content);

Process Tags structure for preserved content defined in C<$content>.

Returns undef.

=head2 C<process_css>

 $obj->process_css;

Process CSS::Struct structure for output.

Returns undef.

=head1 ERRORS

 new():
         From Tags::HTML::new():
                 Parameter 'css' must be a 'CSS::Struct::Output::*' class.
                 Parameter 'tags' must be a 'Tags::Output::*' class.
                 Unknown parameter '%s'.

=head1 EXAMPLE

 use strict;
 use warnings;

 use CSS::Struct::Output::Indent;
 use Tags::HTML::Pre;
 use Tags::Output::Indent;

 # Object.
 my $css = CSS::Struct::Output::Indent->new;
 my $tags = Tags::Output::Indent->new(
         'preserved' => 'pre',
 );
 my $obj = Tags::HTML::Pre->new(
         'css' => $css,
         'tags' => $tags,
 );

 # Process indicator.
 $obj->process(<<'END');
 foo
   bar
     baz
 END

 # Print out.
 print "HTML\n";
 print $tags->flush."\n";

 # Output:
 # HTML
 # TODO

=head1 DEPENDENCIES

L<Tags::HTML>.

=head1 SEE ALSO

=over

=item L<Tags::HTML::Stars>

Tags helper for stars evaluation.

=back

=head1 REPOSITORY

L<https://github.com/michal-josef-spacek/Tags-HTML-Pre>

=head1 AUTHOR

Michal Josef Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

© 2021-2022 Michal Josef Špaček

BSD 2-Clause License

=head1 VERSION

0.01

=cut
