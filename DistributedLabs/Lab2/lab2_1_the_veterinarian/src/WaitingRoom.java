public class WaitingRoom {

    Integer counterDogs = 0;
    Integer counterCats = 0;
    public synchronized void enterRoom(Dog dog) throws InterruptedException {
        while(this.counterDogs>3 || this.counterCats>0){
            System.out.println("I am dog and I entered room, but there is "+this.counterCats+ " cats "+this.counterDogs+" dogs. I am waiting");
            wait();
        }
        System.out.println("I am a dog and I have entered. Being in vet's room...");
        this.counterDogs++;

    }
    public synchronized void enterRoom(Cat cat) throws InterruptedException {
        while (this.counterDogs>0 || this.counterCats > 0){
            System.out.println("I am cat and I entered room, but there is "+this.counterCats+ " cats "+this.counterDogs+" dogs. I am waiting");
            wait();
        }
        System.out.println("I am a cat and I have entered. Being in vet's room...");
        this.counterCats++;
    }
    public synchronized void exitRoom(Dog dog){
        System.out.println("I am a dog and I am exiting the room and notifying all");
        this.counterDogs--;
        notifyAll();
    }
    public synchronized void exitRoom(Cat cat){
        System.out.println("I am a cat and I am exiting the room and notifying all");
        this.counterCats--;
        notifyAll();
    }
}
