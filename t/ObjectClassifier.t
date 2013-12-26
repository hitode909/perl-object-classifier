package t::ObjectClassifier;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier';
}

sub _new : Tests {
    my $oc = ObjectClassifier->new;
    isa_ok $oc, 'ObjectClassifier';
}

sub add : Tests {
    my $oc = ObjectClassifier->new;
    is $oc->length, 0;
    $oc->add(1);
    is $oc->length, 1;
}

sub classify_number_string : Tests {
    my $oc = ObjectClassifier->new;
    isa_ok $oc->classify, 'ObjectClassifier::Class::Unknown';
    $oc->add(3);

    isa_ok $oc->classify, 'ObjectClassifier::Class::Number';
    is $oc->classify->rate, 1;

    $oc->add('a');

    isa_ok $oc->classify, 'ObjectClassifier::Class::String';
    is $oc->classify->rate, 1;
}

sub classify_nested_array : Tests {
    my $oc = ObjectClassifier->new;
    $oc->add([[1], [2]]);

    isa_ok $oc->classify, 'ObjectClassifier::Class::Array';
    is $oc->classify->rate, 1;

    isa_ok $oc->classify->member->classify, 'ObjectClassifier::Class::Array';
    is $oc->classify->member->classify->rate, 1;

    isa_ok $oc->classify->member->classify->member->classify, 'ObjectClassifier::Class::Number';
    is $oc->classify->member->classify->member->classify->rate, 1;
}

sub classify_nested_hash : Tests {
    my $oc = ObjectClassifier->new;
    $oc->add({a => {b => 'c'}});

    isa_ok $oc->classify, 'ObjectClassifier::Class::Hash';
    is $oc->classify->rate, 1;

    isa_ok $oc->classify->member('a')->classify, 'ObjectClassifier::Class::Hash';
    is $oc->classify->member('a')->classify->rate, 1;

    isa_ok $oc->classify->member('a')->classify->member('b')->classify, 'ObjectClassifier::Class::String';
    is $oc->classify->member('a')->classify->member('b')->classify->rate, 1;
}

sub classify_bool : Tests {
    my $oc = ObjectClassifier->new;
    $oc->add(1);
    $oc->add(0);
    isa_ok $oc->classify, 'ObjectClassifier::Class::Bool';
}
