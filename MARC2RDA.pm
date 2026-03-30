package NKC::Transform::MARC2RDA;

use strict;
use warnings;

use Class::Utils qw(set_params);
use English;
use Error::Pure qw(err);
use File::Share ':all';
use Perl6::Slurp qw(slurp);
use XML::Saxon::XSLT3;

our $VERSION = 0.05;

sub new {
	my ($class, @params) = @_;

	# Create object.
	my $self = bless {}, $class;

	# XSLT transformation file.
	$self->{'xslt_transformation_dir'} = dist_dir('NKC-Transform-MARC2RDA').'/';
	$self->{'xslt_transformation_file'} = dist_file('NKC-Transform-MARC2RDA', 'm2r.xsl');

	# Process parameters.
	set_params($self, @params);

	$self->{'_messages'} = [];

	return $self;
}

sub transform {
	my ($self, $marc_xml, @params) = @_;

	my $xslt = slurp($self->{'xslt_transformation_file'});

	my $trans = eval {
		XML::Saxon::XSLT3->new($xslt, $self->{'xslt_transformation_dir'});
	};
	if ($EVAL_ERROR) {
		my $e = $EVAL_ERROR;
		# TODO Add 'StackTrace' err parameter.
		# $e->getStackTrace returns java objects.
		err "Error with construction of 'XML::Saxon::XSLT3'.",
			'Message' => $e->getMessage,
		;
	}
	my $output = $trans->transform($marc_xml, @params);
	my @messages = $trans->messages;
	$self->{'_messages'} = \@messages;

	return $output;
}

sub messages {
	my $self = shift;

	return @{$self->{'_messages'}};
}

1;

__END__

=pod

=encoding utf8

=head1 NAME

NKC::Transform::MARC2RDA - marc2rda transformation class.

=head1 ACKNOWLEDGEMENTS

Development of this software has been made possible by institutional support
for the long-term strategic development of the National Library of the Czech
Republic as a research organization provided by the Ministry of Culture of
the Czech Republic (DKRVO 2024–2028), Area 11: Linked Open Data.

=cut
