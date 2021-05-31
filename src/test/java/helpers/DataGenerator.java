package helpers;
import com.github.javafaker.Faker;
import net.minidev.json.JSONObject;


// This is the class file to generate random Data or Random Text which required during API test

public class DataGenerator {
    

    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@testSelva.com";
        return email;
    }

    public static String getRandomUsername(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }

    public String getRandomUsername2(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }
    
    public static JSONObject getRandomArticValues(){
        Faker faker = new Faker();
        

        String title = faker.gameOfThrones().character();
        String description = faker.gameOfThrones().city();
        String body = faker.gameOfThrones().quote();

        
        // String title = "title21";
        // String description = "Description21";
        // String body = "body content";
        JSONObject jsonObj = new JSONObject();
        jsonObj.put("title", title);
        jsonObj.put("description", description);
        jsonObj.put("body", body);
        System.out.println("The title after json object is -========>"+jsonObj.get("title"));

        return jsonObj;
    }
    
}
