package common;


public interface Task<T> extends java.io.Serializable {

  T execute();

}
