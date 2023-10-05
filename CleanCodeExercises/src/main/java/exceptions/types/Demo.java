package exceptions.types;

class ACMEPort {

    int port;

    public ACMEPort(int port) {
    }

    public void open() {

    }
}

class DeviceResponseException extends RuntimeException { }
class ATM1212UnlockedException extends RuntimeException { }
class GMXError extends RuntimeException { }

public class Demo {

    private static  Logger logger;

    class Logger {

        void log(String mess) {}
        void log(String mess, RuntimeException e) {}
    }

    static void reportPortError(RuntimeException e) {}

    void bad() {

        ACMEPort port = new ACMEPort(465);
        try {
            port.open();
            // ...
        } catch (DeviceResponseException e) {
            reportPortError(e);
            logger.log("Wyjątek odpowiedzi urządzenia", e);
        } catch (ATM1212UnlockedException e) {
            reportPortError(e);
            logger.log("Wyjątek odblokowania", e);
        } catch (GMXError e) {
            reportPortError(e);
            logger.log("Wyjątek odpowiedzi urządzenia");
        } finally {
            // ...
        }
    }

    class LocalPortWrapper {
        private ACMEPort innerPort;

        public LocalPortWrapper(int portNumber) {
            this.innerPort = new ACMEPort(portNumber);
        }

        public void open() {
            try {
                innerPort.open();
            } catch (DeviceResponseException e) {
                throw new PortDeviceFailureException(e);
            } catch (ATM1212UnlockedException e) {
                throw new PortDeviceFailureException(e);
            } catch (GMXError e) {
                throw new PortDeviceFailureException(e);
            }
        }
    }

    class PortDeviceFailureException extends RuntimeException {
        public PortDeviceFailureException(RuntimeException e) {
            super(e);
        }
        @Override
        public String getMessage() {
            return super.getCause().getMessage();
        }
    }

    void better() {

        LocalPortWrapper port = new LocalPortWrapper(456);
        try {
            port.open();
            // ...
        } catch (PortDeviceFailureException e) {
            reportPortError(e);
            logger.log(e.getMessage(), e);
        } finally {
            // ...
        }
    }
}
