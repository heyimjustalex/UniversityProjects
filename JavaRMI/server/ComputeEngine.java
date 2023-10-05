package server;

import common.Task;
import common.Compute;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

public class ComputeEngine implements Compute {

    public <T> T executeTask(Task<T> t) {
        return t.execute();
    }

    private List<Integer> buffer = new ArrayList<>();

    public List<Integer> getBuffer(int howMany){
        if(buffer.isEmpty()) return List.of();
        if(howMany>buffer.size()) return buffer;
        return buffer.subList(0,howMany-1);
    }

    public void addToBuffer(List<Integer> integerList){
        buffer = integerList;
    }

    public static void main(String[] args) {
        if (System.getSecurityManager() == null) System.setSecurityManager(new SecurityManager());
        try {
            String name = "Compute";
            Compute engine = new ComputeEngine();
            Compute stub = (Compute) UnicastRemoteObject.exportObject(engine, 0);
            Registry registry = LocateRegistry.getRegistry();
            registry.rebind(name, stub);
            System.out.println("ComputeEngine bound");
        } catch (Exception e) {
            System.err.println("ComputeEngine exception:");
            e.printStackTrace();
        }
    }
}
