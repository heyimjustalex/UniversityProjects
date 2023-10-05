package client;

import server.ComputeEngine;

import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.util.List;

public class ComputePrimeNumber {
    public static void main(String args[]) {
        if (System.getSecurityManager() == null) System.setSecurityManager(new SecurityManager());
        try {
            String name = "Compute";
            Registry registry = LocateRegistry.getRegistry(args[0]);
            int howMany = Integer.parseInt(args[1]);
            ComputeEngine comp = (ComputeEngine) registry.lookup(name);
            List<Integer> buffer = comp.getBuffer(howMany);
            PrimeNumber taskPrimeNumber;
            List<Integer> primeNumbers;
            if (buffer.size() < howMany) {
                int howManyLeftToCompute = howMany - buffer.size();
                taskPrimeNumber = new PrimeNumber(howManyLeftToCompute, buffer.get(buffer.size() - 1));
                primeNumbers = buffer;
                primeNumbers.addAll(comp.executeTask(taskPrimeNumber));
                comp.addToBuffer(primeNumbers);
            } else
                primeNumbers = buffer;
            System.out.println(primeNumbers);
        } catch (Exception e) {
            System.err.println("ComputePi exception:");
            e.printStackTrace();
        }
    }
}
