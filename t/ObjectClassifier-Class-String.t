package t::ObjectClassifier::Class::String;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::String';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::String->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::String';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::String->new;
    ok $c->accept('a');
    ok $c->accept('');
    ok $c->accept(1);
    ok ! $c->accept(undef);
    ok ! $c->accept({});
}
