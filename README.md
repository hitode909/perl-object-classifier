# perl-object-classifier

A class to find the common structures of objects

## Example

```perl
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

print Dumper $oc->classify->dump;
#  => {
#      'name(100%)' => 'String(100%)',
#      'hobbies(50%)' => [
#                          'String(100%)'
#                        ],
#      'age(100%)' => 'Number(100%)'
#     };
```

This means that all objects have name and age, 50% of obects have hobbies.
