use strict;
use warnings;

use File::Object;
use NKC::Transform::MARC2RDA;
use Perl6::Slurp qw(slurp);
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Data dir.
my $data_dir = File::Object->new->up->dir('data');

# Test.
my $obj = NKC::Transform::MARC2RDA->new;
my $input = slurp($data_dir->file('cnb002955079.xml')->s);
my $ret = $obj->transform($input);
my @ret = $obj->messages;
is_deeply(
	\@ret,
	[
		'Record nkc20172955079 identified as cam aggregate and was not processed.',
	],
	'No messages.',
);

# Test.
$obj = NKC::Transform::MARC2RDA->new;
$input = slurp($data_dir->file('cnb003004194.xml')->s);
$ret = $obj->transform($input);
@ret = $obj->messages;
is_deeply(
	\@ret,
	[
		'Record nkc20183004194 identified as cam aggregate and was not processed.',
	],
	'No messages.',
);
