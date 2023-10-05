package RESTDictionaryExercise.beans;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
@XmlAccessorType (XmlAccessType.FIELD)
public class Words {

    @XmlElement(name="my_words")
    private List<Word> words;

    private static Words instance;

    private Words() {
        words = new ArrayList<Word>();
    }

    //Singleton
    public synchronized static Words getInstance(){
        if(instance==null)
            instance = new Words();
        return instance;
    }

    public synchronized List<Word> getWords() {

        return new ArrayList<>(words);

    }

    public synchronized void setWords(List<Word> words) {
        this.words = words;
    }

    public synchronized void add(Word word){
        words.add(word);
    }


    public Word getByName(String name){
        List<Word> wordsCopy = getWords();
        for(Word w: wordsCopy)
            if(w.getName().toLowerCase().equals(name.toLowerCase()))
                return w;
        return null;
    }
    public Word deleteByName(String name){

        for(Word w: words)
            if(w.getName().toLowerCase().equals(name.toLowerCase()))
            {
                words.remove(w);
                return w;
            }
        return null;
    }
    public Word updateDefinitionByName(String name, String definition){

        for(Word w: words)
            if(w.getName().toLowerCase().equals(name.toLowerCase()))
            {
                w.setDefinition(definition);
                return w;
            }
        return null;
    }

}