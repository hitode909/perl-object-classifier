package t::ObjectClassifier::Class::Number;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::Number';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::Number->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::Number';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::Number->new;
    ok $c->accept(3);
    ok $c->accept(0);
    ok $c->accept(0.2);
    ok ! $c->accept('a');
    ok ! $c->accept(undef);
    ok ! $c->accept({});
    ok ! $c->accept([]);
}

sub rate : Tests {
    my $c = ObjectClassifier::Class::Number->new;
    is $c->rate, 0;
    $c->add(3);
    is $c->rate, 1;
    $c->add('a');
    is $c->rate, 0.5;
}
