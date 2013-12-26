package t::ObjectClassifier::Class::Hash;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Hash';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::Hash->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::Hash';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::Hash->new;
    ok $c->accept({});
    ok $c->accept({a => 'b'});
    ok ! $c->accept('a');
}

sub members : Tests {
    my $c = ObjectClassifier::Class::Hash->new;
    ok $c->accept({});
    is_deeply $c->keys, [];
    ok $c->accept({a => 'b'});
    is_deeply $c->keys, ['a'];
    isa_ok $c->member('a'), 'ObjectClassifier';
    isa_ok $c->member('a')->classify, ObjectClassifier::Class::String;
}

sub rate_of_member : Tests {
    my $c = ObjectClassifier::Class::Hash->new;
    $c->add({a => 1});
    $c->add({a => 1, b => 2});
    is $c->rate_of_member('a'), 1;
    is $c->rate_of_member('b'), 0.5;
    is $c->rate_of_member('c'), 0;
}
