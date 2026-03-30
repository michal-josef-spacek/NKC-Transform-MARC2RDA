use strict;
use warnings;

use File::Object;
use NKC::Transform::MARC2RDA;
use Perl6::Slurp qw(slurp);
use Test::More 'tests' => 3;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Data dir.
my $data_dir = File::Object->new->up->dir('data');

# Test.
my $obj = NKC::Transform::MARC2RDA->new;
my $input = slurp($data_dir->file('cnb002955079.xml')->s);
$input = decode_utf8($input);
my $ret = $obj->transform($input);
my $expected_string = slurp($data_dir->file('cnb002955079-expected.xml')->s);
$expected_string = decode_utf8($expected_string);
is($ret, $expected_string, 'Compare transformed with expected (default).');

# Test.
$obj = NKC::Transform::MARC2RDA->new;
$input = slurp($data_dir->file('cnb003439598.xml')->s);
$input = decode_utf8($input);
$ret = $obj->transform($input);
$ret =~ s{(?<=#)\d{4}-\d{2}-\d{2}[Tt][^"<>]+}{DATE}g;
$expected_string = slurp($data_dir->file('cnb003439598-expected.xml')->s);
$expected_string = decode_utf8($expected_string);
is($ret, $expected_string, 'Compare transformed with expected (default).');
