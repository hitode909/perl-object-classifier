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

sub classify_array : Tests {
    my $oc = ObjectClassifier->new;
    isa_ok $oc->classify, 'ObjectClassifier::Class::Unknown';
    $oc->add(3);

    isa_ok $oc->classify, 'ObjectClassifier::Class::Number';
    is $oc->classify->rate, 1;

    $oc->add('a');

    isa_ok $oc->classify, 'ObjectClassifier::Class::String';
    is $oc->classify->rate, 1;
}
