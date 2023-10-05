package BetterCode_ex1.Structures;

public class Tuple<KEY, VALUE> {
    public final KEY key;
    public final VALUE value;
    public Tuple(KEY key, VALUE value) {
        this.key = key;
        this.value = value;
    }
}