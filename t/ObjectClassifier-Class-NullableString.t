package t::ObjectClassifier::Class::NullableString;
use t::test;

sub _require : Test(startup => 1) {
    my ($self) = @_;

    use_ok 'ObjectClassifier::Class::NullableString';
}

sub _new : Tests {
    my $c = ObjectClassifier::Class::NullableString->new;
    isa_ok $c, 'ObjectClassifier::Class';
    isa_ok $c, 'ObjectClassifier::Class::NullableString';
}

sub accept : Tests {
    my $c = ObjectClassifier::Class::NullableString->new;
    ok $c->accept('a');
    ok $c->accept('');
    ok $c->accept(1);
    ok $c->accept(undef);
    ok ! $c->accept({});
}
