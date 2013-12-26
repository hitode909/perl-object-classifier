use strict;
use warnings;
use FindBin;
use lib 'lib';
use lib "$FindBin::Bin/../lib";
use Data::Dumper;
use ObjectClassifier;

my $oc = ObjectClassifier->new;

$oc->add({
    name => 'Alice',
    age => 20,
});
$oc->add({
    name => 'Bob',
    age => 21,
    hobbies => ['tennis', 'soccer'],
});

print $oc->classify->class_name . "\n";
# => Hash(100%)<age(100%): Number(100%), hobbies(50%): Array(100%)<String(100%)>, name(100%): String(100%)>

print Dumper $oc->classify->dump;
# $VAR1 = {
#           'name(100%)' => 'String(100%)',
#           'hobbies(50%)' => [
#                               'String(100%)'
#                             ],
#           'age(100%)' => 'Number(100%)'
#         };
