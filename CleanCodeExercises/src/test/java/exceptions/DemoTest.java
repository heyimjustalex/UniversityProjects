package exceptions;

import junit.framework.TestCase;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.function.Executable;

import static org.junit.jupiter.api.Assertions.assertThrows;

class DemoTest extends TestCase {

    @Test
    public void shouldThrow_whenInvalidFileName() {
        // given
        String invalidFileName = "invalid";

        // when
        Executable executable = () -> Demo.retreiveObject(invalidFileName);

        // then
        assertThrows(RuntimeException.class, executable);
    }
}