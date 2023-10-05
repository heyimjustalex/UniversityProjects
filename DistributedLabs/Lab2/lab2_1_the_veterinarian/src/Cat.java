public class Cat implements Runnable{

    WaitingRoom waitingRoom;
    public Cat (WaitingRoom waitingRoom){
        this.waitingRoom = waitingRoom;
    }
    @Override
    public void run() {
        try {
            this.waitingRoom.enterRoom(this);
            Thread.sleep(1000);
            this.waitingRoom.exitRoom(this);
        } catch (InterruptedException e) {
            throw new RuntimeException(e);
        }

    }
}
