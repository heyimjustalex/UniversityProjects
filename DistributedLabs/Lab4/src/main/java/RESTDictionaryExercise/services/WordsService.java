package RESTDictionaryExercise.services;
import RESTDictionaryExercise.beans.Word;
import RESTDictionaryExercise.beans.Words;
import javax.ws.rs.*;
import javax.ws.rs.core.Response;

@Path("words")
public class WordsService {

    @GET
    @Produces({"application/json", "application/xml"})
    public Response getWords(){
        return Response.ok(Words.getInstance()).build();
    }


    @Path("add")
    @POST
    @Consumes({"application/json", "application/xml"})
    public Response addWord(Word u) {
        synchronized (this) {
            Word existingWord = Words.getInstance().getByName(u.getName());
            if (existingWord != null) {
                return Response.status(Response.Status.CONFLICT).build();
            }
            Words.getInstance().add(u);
            return Response.ok(u).build();
        }
    }


    @Path("{name}")
    @GET
    @Produces({"application/json", "application/xml"})
    public Response getByName(@PathParam("name") String name){
        Word word  = Words.getInstance().getByName(name);
        if(word!=null)
            return Response.ok(word).build();
        else
            return Response.status(Response.Status.NOT_FOUND).build();
    }

    @Path("{name}")
    @DELETE
    @Produces({"application/json", "application/xml"})
    public Response deleteByName(@PathParam("name") String name){
        Word word  = Words.getInstance().getByName(name);
        if(word!=null)
        {
            Words.getInstance().deleteByName(name);
            return Response.ok(word).build();
        }
        else
            return Response.status(Response.Status.NOT_FOUND).build();
    }


    @PUT
    @Produces({"application/json", "application/xml"})
    public Response updateByName(Word word) {
        synchronized (this) {
            Word foundWord = Words.getInstance().getByName(word.getName());
            if (foundWord != null) {
                Words.getInstance().updateDefinitionByName(word.getName(), word.getDefinition());
                return Response.ok(word).build();
            } else
                return Response.status(Response.Status.NOT_FOUND).build();
        }
    }

}