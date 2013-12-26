package t::ObjectClassifier::Class::Hash;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Hash';
}

sub _new : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    isa_ok $oc, 'ObjectClassifier::Class';
    isa_ok $oc, 'ObjectClassifier::Class::Hash';
}

sub accept : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    ok $oc->accept({});
    ok $oc->accept({a => 'b'});
    ok ! $oc->accept('a');
}

sub members : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    ok $oc->accept({});
    is_deeply $oc->keys, [];
    ok $oc->accept({a => 'b'});
    is_deeply $oc->keys, ['a'];
    isa_ok $oc->member('a'), 'ObjectClassifier';
    isa_ok $oc->member('a')->classify, ObjectClassifier::Class::String;
}

sub rate_of_member : Tests {
    my $oc = ObjectClassifier::Class::Hash->new;
    $oc->add({a => 1});
    $oc->add({a => 1, b => 2});
    is $oc->rate_of_member('a'), 1;
    is $oc->rate_of_member('b'), 0.5;
    is $oc->rate_of_member('c'), 0;
}
